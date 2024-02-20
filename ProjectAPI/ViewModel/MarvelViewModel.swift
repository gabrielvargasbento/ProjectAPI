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
    @Published var marvelCharacter: MarvelCharacter? = nil
    @Published var isRefreshing = true
    @Published var error: UserError?
    @Published var hasError: Bool
    
    let environmentVariables: [String: AnyObject]? = Bundle.main.infoDictionary?["EnvironmentVariables"] as? [String: AnyObject]
    let privateKey: String
    let publicKey: String
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        self.isRefreshing = true
        self.hasError = false
        
        self.privateKey = environmentVariables?["PRIVATE_API_KEY"] as? String ?? ""
        self.publicKey = environmentVariables?["PUBLIC_API_KEY"] as? String ?? ""
    }
    
    /**
     Fetches data of `MarvelCharacter`array  from Marvel API, using Combine framework.
     Upon successful retrieval, the decoded data will be stored in `marvelCharacters`.
     */
    func fetchData() {
        
        self.isRefreshing = true
        self.hasError = false

        let timeStamp = String(Date().timeIntervalSince1970)
        
        let hash = "\(timeStamp)\(self.privateKey)\(self.publicKey)".md5()
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
    
    /**
     Fetches data of `MarvelCharacter` from Marvel API, using Combine framework.
     Upon successful retrieval, the decoded data will be stored in `marvelCharacter`.
     */
    func fetchDataItem(identifier: String) {
        
        self.isRefreshing = true
        self.hasError = false
        
        let timeStamp = String(Date().timeIntervalSince1970)
        
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        let baseURL = "http://gateway.marvel.com/v1/public/characters/\(identifier)"
        
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
                return characterDataWrapper.data.results[0]
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
                self?.marvelCharacter = marvel
            }
            .store(in: &bag)
    }
}
