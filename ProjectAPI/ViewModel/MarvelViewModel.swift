//
//  MarvelViewModel.swift
//  ProjectAPI
//
//  Created by dti Digital on 15/02/24.
//

import Foundation
import SwiftUI
import CwlCatchException
import Combine

class MarvelViewModel: ObservableObject {
    
    let url = URL(string: "https://api.github.com/repositories")!
    @Published var apiList: [Repository] = []
    private var bag = Set<AnyCancellable>()
    
    func fetchData() {
        
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [Repository].self, decoder: JSONDecoder())
            .sink { res in
                
            } receiveValue: { [weak self] repositories in
                self?.apiList = repositories
            }
            .store(in: &bag)
    }
}

