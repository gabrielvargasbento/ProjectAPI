//
//  RepositoriesViewModel.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation
import SwiftUI

class RepositoriesViewModel: ObservableObject, ViewModelProtocol {
    
    typealias T = Repository
    
    @Published var apiService = APIService<Repository>()
    @Published var repositoryList: [T] = []
    @Published var selectedRepository: T? = nil
    
    var url: URL
    
    init(url: URL = URL(string: "https://api.github.com/repositories")!) {
        self.url = url
    }
    
    func fetch(completion: @escaping ([T]?, Error?) -> ()) {
        
        #if UITEST
        self.repositoryList = mockedRepositoryList
        completion(mockedRepositoryList, nil)
        
        #else
        self.apiService.fetchData(from: url) { (repository, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            
            if let decodedData = repository {
                DispatchQueue.main.async {
                    self.repositoryList = decodedData
                    print(decodedData)
                    completion(decodedData, nil)
                }
            }
        }
        #endif
    }
    
    func fetchItem(identifier: String?, completion: @escaping (T?, Error?) -> ()) {
        
        if let identifier = identifier {
            guard let newUrl = URL(string: "https://api.github.com/repos/\(identifier)") else {
                print("Invalid URL")
                let errorURL = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                completion(nil, errorURL)
                return
            }
            self.url = newUrl
        }
        
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

