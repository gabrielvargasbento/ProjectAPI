//
//  APIServiceCombine.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/01/24.
//

import Foundation
import CwlCatchException
import Combine

protocol APIServiceCombineProtocol {
    associatedtype T: Decodable
    func fetchData(from url: URL)
}

class APIServiceCombine<T: Decodable>: ObservableObject {
    
    @Published var apiListItem: T? = nil
    @Published private(set) var isRefreshing = false
    @Published var error: UserError?
    @Published var hasError: Bool
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        self.isRefreshing = true
        self.hasError = false
    }
    
    /**
     Fetches data of an associated type `T` from the specified URL using Combine framework.
     Upon successful retrieval, the decoded data will be stored in `apiListItem`.
     - Parameters:
        - url: The URL from which to fetch the data.
     */
    func fetchData(from url: URL) {

        self.isRefreshing = true
        self.hasError = false
        self.apiListItem = nil
        
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

/**
 Enum to describe the errors while fetching data.
 */
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
