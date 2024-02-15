//
//  APIServiceCombine.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/01/24.
//

import Foundation
import CwlCatchException
import Combine

class APIServiceCombine<T: Decodable>: ObservableObject, RandomAccessCollection {
    
    @Published var apiList: [T] = []
    @Published var apiListItem: T? = nil
    @Published var apiItem: T? = nil
    @Published var isRefreshing = true
    @Published var error: UserError?
    @Published var hasError: Bool
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        self.isRefreshing = true
        self.hasError = false
    }
    
    var startIndex: Int { apiList.startIndex }
    var endIndex: Int { apiList.endIndex }
    
    func index(after i: Int) -> Int {
        return apiList.index(after: i)
    }
    
    subscript(position: Int) -> T {
        return apiList[position]
    }
    
    func fetchData(from url: URL) {

        self.isRefreshing = true
        self.hasError = false
        
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .tryMap({ data in
                let decoder = JSONDecoder()
                let dataWrapper = try decoder.decode(T.self, from: data)
                
                return dataWrapper
            })
            .sink { res in
                
                defer { self.isRefreshing = false }
                
                switch res {
                case .failure(let error):
                    self.hasError = true
                    self.error = UserError.custum(erro: error)
                default:
                    break
                }
                
            } receiveValue: { [weak self] data in
                self?.apiListItem = data
            }
            .store(in: &bag)
    }
}


enum UserError: LocalizedError {
    
    case custum(erro: Error)
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .failedToDecode:
            return "Failed to decode response"
        case .custum(let error):
            return error.localizedDescription
        case .invalidStatusCode:
            return "Request falls within an invalid range"
        }
    }
}
