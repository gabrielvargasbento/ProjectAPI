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
        
        self.apiService.fetchData(from: url) { (harryPotter, error) in
            if let decodedData = harryPotter {
                DispatchQueue.main.async {
                    self.harryPotterList = decodedData
                }
            }
        }
        
    }
    
    func fetchHarryPotterById(id: String, completion: @escaping (HarryPotter?, ProviderError?) -> ()) {
        guard let url = URL(string: "https://hp-api.onrender.com/api/character/\(id)") else {
            print("Invalid URL")
            completion(nil, .invalidURL)
            return
        }
        
        print("url: \(url)")
        
        self.apiService.fetchDataItem(from: url) { (harryPotter, error) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                completion(nil, error)
            }
            
            if let decodedData = harryPotter {
                DispatchQueue.main.async {
                    self.selectedCharacter = decodedData
                    print(decodedData)
                    completion(decodedData, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
}
