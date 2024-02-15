//
//  MarvelViewModel.swift
//  ProjectAPI
//
//  Created by dti Digital on 15/02/24.
//

import Foundation
import SwiftUI
import CwlCatchException
import Combine

class MarvelViewModel: ObservableObject {
    
    @Published var marvelCharacters: [MarvelCharacter] = []
    @Published var isRefreshing = true
    @Published var error: UserError?
    @Published var hasError: Bool
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        self.isRefreshing = true
        self.hasError = false
    }
    
    func fetchData() {
        
        self.isRefreshing = true
        self.hasError = false
        
        let publicKey = "c907db2303921dd939e0c08de2e497fa"
        let privateKey = "cfee6d1310a9b39c841efccb0bdd6b218698bbd3"
        let timeStamp = String(Date().timeIntervalSince1970)
        
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        let baseURL = "http://gateway.marvel.com/v1/public/characters"
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "ts", value: timeStamp),
            URLQueryItem(name: "hash", value: hash)
        ]
        
        let url = components.url ?? URL(string: baseURL)!

        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .tryMap({ data in
                let decoder = JSONDecoder()
                let characterDataWrapper = try decoder.decode(CharacterDataWrapperMarvel.self, from: data)
                return characterDataWrapper.data.results
            })
            .sink { res in
                
                defer { self.isRefreshing = false }
                
                switch res {
                case .failure(let error):
                    self.hasError = true
                    self.error = UserError.custum(erro: error)
                default:
                    break
                }
                
            } receiveValue: { [weak self] marvel in
                self?.marvelCharacters = marvel
            }
            .store(in: &bag)
    }
}
