//
//  MarvelViewModel2.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/02/24.
//

import Foundation
import SwiftUI
import CwlCatchException

class MarvelViewModel2: ObservableObject {
    
    typealias T = CharacterDataWrapperMarvel
    
    @Published var apiService = APIServiceCombine<CharacterDataWrapperMarvel>()
    
    @Published var marvelCharacters: [MarvelCharacter] = []
    @Published var marvelCharacterSelected: MarvelCharacter? = nil
    @Published var isRefreshing = true
    @Published var error: UserError? = nil
    @Published var hasError: Bool
    
    private let publicKey = "c907db2303921dd939e0c08de2e497fa"
    private let privateKey = "cfee6d1310a9b39c841efccb0bdd6b218698bbd3"
    
    var url = URL(string: "http://gateway.marvel.com/v1/public/characters")!
    
    init() {
        
        self.isRefreshing = true
        self.hasError = false
    }
    
    func fetchData() {
        
        let timeStamp = String(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        let baseURL = "http://gateway.marvel.com/v1/public/characters"
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "ts", value: timeStamp),
            URLQueryItem(name: "hash", value: hash)
        ]
        self.url = components.url ?? URL(string: baseURL)!
        
        self.apiService.fetchData(from: url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.marvelCharacters = (self.apiService.apiListItem?.data.results)!
            self.error = self.apiService.error
            self.hasError = self.apiService.hasError
            self.isRefreshing = self.apiService.isRefreshing
        }
    }
    
    func fetchDataItem(identifier: String) {
        
        let timeStamp = String(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        let baseURL = "http://gateway.marvel.com/v1/public/characters/\(identifier)"
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "ts", value: timeStamp),
            URLQueryItem(name: "hash", value: hash)
        ]
        
        self.url = components.url ?? URL(string: baseURL)!
        
        self.apiService.fetchData(from: url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.marvelCharacterSelected = (self.apiService.apiListItem?.data.results[0])!
            self.error = self.apiService.error
            self.hasError = self.apiService.hasError
            self.isRefreshing = self.apiService.isRefreshing
        }
    }
}

