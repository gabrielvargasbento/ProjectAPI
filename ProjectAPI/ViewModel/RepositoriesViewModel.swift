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
        completion(mockList, nil)
        
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

let owner1 = Owner(login: "mojombo", id: 1, avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", htmlUrl: "https://github.com/mojombo")
let repo1 = Repository(id: 1, name: "grit", fullName: "mojombo/grit", owner: owner1, description: "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.")

// Objeto Repository 2
let owner2 = Owner(login: "wycats", id: 4, avatarUrl: "https://avatars.githubusercontent.com/u/4?v=4", htmlUrl: "https://github.com/wycats")
let repo2 = Repository(id: 26, name: "merb-core", fullName: "wycats/merb-core", owner: owner2, description: "Merb Core: All you need. None you don't.")

// Objeto Repository 3
let owner3 = Owner(login: "rubinius", id: 317747, avatarUrl: "https://avatars.githubusercontent.com/u/317747?v=4", htmlUrl: "https://github.com/rubinius")
let repo3 = Repository(id: 27, name: "rubinius", fullName: "rubinius/rubinius", owner: owner3, description: "The Rubinius Language Platform")

let mockedRepositoryList = [repo1, repo2, repo3]
