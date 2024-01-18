//
//  RepositoriesViewModel.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation
import SwiftUI

class RepositoriesViewModel: ObservableObject {
    
    @Published var apiService = APIService<Repository>()
    @Published var repositoryList: [Repository] = []
    @Published var selectedRepository: Repository? = nil
    
    func fetchRepositories() {
        guard let url = URL(string: "https://api.github.com/repositories") else {
            print("Invalid URL")
            return
        }
    
        self.apiService.fetchData(from: url) { (repository, error) in
            if let decodedData = repository {
                DispatchQueue.main.async {
                    self.repositoryList = decodedData
                }
            }
        }
    }
    
    func fetchRepositoryByName(name: String, completion: @escaping (Repository?, Error?) -> ()) {
        guard let url = URL(string: "https://api.github.com/repos/\(name)") else {
            print("Invalid URL")
            let errorURL = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(nil, errorURL)
            return
        }
        
        print("url: \(url)")
        
        self.apiService.fetchDataItem(from: url) { (repository, error) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                completion(nil, error)
            }
            
            if let decodedData = repository {
                DispatchQueue.main.async {
                    self.selectedRepository = decodedData
                    print(decodedData)
                    completion(decodedData, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
}
