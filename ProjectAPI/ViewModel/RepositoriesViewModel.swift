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
        
        self.apiService.fetchData(from: url) { decodedData in
            if let decodedData = decodedData {
                DispatchQueue.main.async {
                    self.repositoryList = decodedData
                }
            }
        }
    }
    
    func fetchRepositoryByName(name: String, completion: @escaping (Result<Repository, Error>) -> ()) {
        guard let url = URL(string: "https://api.github.com/repos/\(name)") else {
            print("Invalid URL")
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        print("url: \(url)")
        
        self.apiService.fetchDataItem(from: url) { (result: Result<Repository?, Error>) in
            switch result {
            case .success(let decodedData):
                if let decodedData = decodedData {
                    DispatchQueue.main.async {
                        self.selectedRepository = decodedData
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
