//
//  MarvelCombineViewModel.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/02/24.
//

import Foundation
import SwiftUI
import CwlCatchException

class MarvelCombineViewModel: ObservableObject, ViewModelCombineProtocol {
    
    typealias T = CharacterDataWrapperMarvel
    
    @Published var apiService = APIServiceCombine<CharacterDataWrapperMarvel>()

    let environmentVariables: [String: AnyObject]? = Bundle.main.infoDictionary?["EnvironmentVariables"] as? [String: AnyObject]
    let privateKey: String
    let publicKey: String
    
    private static var offset = 0
    
    init() {
        self.privateKey = environmentVariables?["PRIVATE_API_KEY"] as? String ?? ""
        self.publicKey = environmentVariables?["PUBLIC_API_KEY"] as? String ?? ""
    }
    
    var url = URL(string: "http://gateway.marvel.com/v1/public/characters")!
    
    /**
     Fetches data Marvel array from Marvel API, using Combine framework.
     Upon successful retrieval, the decoded data will be stored in `apiService.apiListItem`.
     */
    func fetchData() {
        
        let timeStamp = String(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)\(privateKey)\(publicKey)".md5()
        let baseURL = "http://gateway.marvel.com/v1/public/characters"
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "ts", value: timeStamp),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "offset", value: "\(MarvelCombineViewModel.offset)"),
            URLQueryItem(name: "limit", value: "20")
        ]
        self.url = components.url ?? URL(string: baseURL)!
        
        self.apiService.fetchData(from: url)
        
        MarvelCombineViewModel.offset += 20
    }
    
    /**
     Fetches data Marvel array from Marvel API, using Combine framework.
     Upon successful retrieval, the decoded data will be stored in `apiService.apiListItem`.
     
     - Parameters:
        - identifier: An optional string with the Repository name.
     */
    func fetchDataItem(identifier: String?) {
        
        if let identifier = identifier {
            
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
        }
        
        self.apiService.fetchData(from: url)
    }
}

