//
//  RepositoriesViewModel.swift
//  GitHubList
//
//  Created by dti Digital on 14/12/23.
//

import Foundation
import SwiftUI

class RepositoriesViewModel: ObservableObject {
    
    @Published var apiService = APIService<Repository>()
    @Published var repositoryList: [Repository] = []
    
    func fetchRepositories() {
        guard let url = URL(string: "https://api.github.com/repositories") else {
            print("Invalid URL")
            return
        }
        repositoryList = apiService.fetchData(from: url)
    }
}
