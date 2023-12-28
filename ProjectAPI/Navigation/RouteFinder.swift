//
//  RouteFinder.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 27/12/23.
//

import Foundation

enum DeepLinkURLs: String {
    
    case repositoryMenu
    case harryPotterMenu
    
    case repository
    case harryPotter
}

struct RouteFinder {
    
    let repoViewModel = RepositoriesViewModel()
    let harrypotterViewModel = HarryPotterViewModel()
    
    func find(from url: URL) -> Route? {
        
        guard let host = url.host()
        else {
            return nil
        }
        
        print(host)
        
        switch DeepLinkURLs(rawValue: host) {
            
        case .repositoryMenu:
            return .repositoryMenu
        case .harryPotterMenu:
            return .harryPotterMenu
            
        case .repository:
            let queryParams = url.queryParamaters
            
            guard let name = queryParams?["name"] as? String else { return nil }
            print(name)
            
            //repoViewModel.fetchRepositories()
            //print(repoViewModel.repositoryList.count)
            
            if let repo = repoViewModel.repositoryList.first(where: { $0.name == name }) {
                return .repositoryItem(item: repo)
            } else {
                return nil
            }
                    
        default:
            return nil
        }
    }
}

extension URL {
    public var queryParamaters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value?.replacingOccurrences(of: "+", with: " ")
        }
    }
}
