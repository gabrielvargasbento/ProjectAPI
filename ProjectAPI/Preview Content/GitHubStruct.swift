//
//  GitHubStruct.swift
//  GitHubList
//
//  Created by dti Digital on 12/12/23.
//

import Foundation

// Responsavel por consumir a API e gerar um array com os repositorios
class getGitHub: ObservableObject {
    
    @Published var repositories: [Repository] = []
    
    func fetch() {
        
        guard let url = URL(string: "https://api.github.com/repositories")
        else {
            return
        }
                
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil
            else {
                return
            }
                        
            do {
                let parsed = try JSONDecoder().decode([Repository].self, from: data)
                DispatchQueue.main.async {
                    self?.repositories = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
