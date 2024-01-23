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
    
    func find(from url: URL, completion: @escaping (Route?) -> ()) {
        
        guard let host = url.host else {
            completion(nil)
            return
        }
                
        switch DeepLinkURLs(rawValue: host) {
            
        case .repositoryMenu:
            completion(.repositoryMenu)
            
        case .harryPotterMenu:
            completion(.harryPotterMenu)
            
        case .repository:
            let queryParams = url.queryParamaters
            
            guard let name = queryParams?["name"] as? String else {
                completion(nil)
                return
            }
            
            repoViewModel.fetchItem(identifier: name) { repository, error in
                
                if error != nil {
                    print(error as Any)
                    completion(nil)
                }
                print(repository!)
                completion(.repositoryItem(item: repository!))
            }

        case .harryPotter:
            completion(nil)
            let queryParams = url.queryParamaters
            
            guard let id = queryParams?["id"] as? String else {
                completion(nil)
                return
            }
            
            harrypotterViewModel.fetchItem(identifier: id) { harryPotter, error in

                if error != nil {
                    print(error as Any)
                    completion(nil)
                }
                print(harryPotter!)
                completion(.harryPotterItem(item: harryPotter!))
            }
            
        default:
            completion(nil)
        }
    }
}
