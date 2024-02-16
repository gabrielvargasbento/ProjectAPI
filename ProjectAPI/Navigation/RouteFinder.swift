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
    case marvelMenu
    
    case repository
    case harryPotter
    case marvel
}

struct RouteFinder {
    
    var repoViewModel: any ViewModelProtocol
    var harryPotterViewModel: any ViewModelProtocol
    var marvelViewModel: any ViewModelCombineProtocol
    
    init(repoViewModel: any ViewModelProtocol = RepositoriesViewModel(),
         harryPotterViewModel: any ViewModelProtocol = HarryPotterViewModel(),
         marvelViewModel: any ViewModelCombineProtocol = MarvelCombineViewModel()) {
        
        self.repoViewModel = repoViewModel
        self.harryPotterViewModel = harryPotterViewModel
        self.marvelViewModel = marvelViewModel
    }
    
    func find(from url: URL, completion: @escaping (Route?, Error?) -> ()) {
        
        guard let host = url.host else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL Host"])
            completion(nil, error)
            return
        }
                
        switch DeepLinkURLs(rawValue: host) {
            
        case .repositoryMenu:
            completion(.repositoryMenu, nil)
            
        case .harryPotterMenu:
            completion(.harryPotterMenu, nil)
            
        case .marvelMenu:
            completion(.marvelMenu, nil)
            
        case .repository:
            let queryParams = url.queryParamaters
            
            guard let name = queryParams?["name"] as? String else {
                let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid Query Params"])
                completion(nil, error)
                return
            }
            
            repoViewModel.fetchItem(identifier: name) { repository, error in
                
                if error != nil {
                    print(error as Any)
                    completion(nil, error)
                }
                print(repository!)
                completion(.repositoryItem(item: repository! as! Repository), nil)
            }

        case .harryPotter:
            let queryParams = url.queryParamaters
            
            guard let id = queryParams?["id"] as? String else {
                let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid Query Params"])
                completion(nil, error)
                return
            }
            
            harryPotterViewModel.fetchItem(identifier: id) { harryPotter, error in

                if error != nil {
                    print(error as Any)
                    completion(nil, error)
                }
                print(harryPotter!)
                completion(.harryPotterItem(item: harryPotter! as! HarryPotter), nil)
            }
            
        case .marvel:
            let queryParams = url.queryParamaters
            
            guard let id = queryParams?["id"] as? String else {
                let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid Query Params"])
                completion(nil, error)
                return
            }
            
            marvelViewModel.fetchDataItem(identifier: id)
            
            completion(nil, nil)
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                
//                if marvelViewModel.apiService.hasError {
//                    completion(nil, marvelViewModel.apiService.error)
//                } else {
//                    let item = marvelViewModel.selectedItem!
//                    completion(.marvelItem(item: item), nil)
//                }
//            }
            
        default:
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(nil, error)
        }
    }
}
