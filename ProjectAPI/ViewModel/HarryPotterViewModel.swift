//
//  HarryPotterViewModel.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation
import SwiftUI

class HarryPotterViewModel: ObservableObject {
    
    @Published var apiService = APIService<HarryPotter>()
    @Published var harryPotterList: [HarryPotter] = []
    @Published var selectedCharacter: HarryPotter? = nil
    
    func fetchHarryPotter() {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            print("Invalid URL")
            return
        }
        
        self.apiService.fetchData(from: url) { decodedData in
            if let decodedData = decodedData {
                DispatchQueue.main.async {
                    self.harryPotterList = decodedData
                }
            }
        }
        
    }
    
    func fetchHarryPotterById(id: String, completion: @escaping (Result<HarryPotter, Error>) -> ()) {
        guard let url = URL(string: "https://hp-api.onrender.com/api/character/\(id)") else {
            print("Invalid URL")
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        print("url: \(url)")
        
        self.apiService.fetchDataItem(from: url) { (result: Result<HarryPotter?, Error>) in
            switch result {
            case .success(let decodedData):
                if let decodedData = decodedData {
                    DispatchQueue.main.async {
                        self.selectedCharacter = decodedData
                        print(decodedData)
                        completion(.success(decodedData))
                    }
                } else {
                    completion(.failure(NSError(domain: "Decoding Error", code: -1, userInfo: nil)))
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
}
