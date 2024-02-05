//
//  HarryPotterViewModel.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation
import SwiftUI

class HarryPotterViewModel: ObservableObject, ViewModelProtocol {
    
    typealias T = HarryPotter
    
    @Published var apiService = APIService<HarryPotter>()
    @Published var harryPotterList: [HarryPotter] = []
    @Published var selectedCharacter: HarryPotter? = nil
    
    var url: URL
    
    init(url: URL = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor")!) {
        self.url = url
    }
    
    func fetch(completion: @escaping ([T]?, Error?) -> ()) {
        
        #if UITEST
        self.harryPotterList = mockedHarryPotterList
        completion(mockedHarryPotterList, nil)

        #else
        self.apiService.fetchData(from: url) { (harryPotter, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            
            if let decodedData = harryPotter {
                DispatchQueue.main.async {
                    self.harryPotterList = decodedData
                    print(decodedData)
                    completion(decodedData, nil)
                }
            }
        }
        #endif
    }
    
    func fetchItem(identifier: String?, completion: @escaping (HarryPotter?, Error?) -> ()) {
        
        if let identifier = identifier {
            guard let newUrl = URL(string: "https://hp-api.onrender.com/api/character/\(identifier)") else {
                print("Invalid URL")
                let errorURL = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                completion(nil, errorURL)
                return
            }
            self.url = newUrl
        }
        
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
