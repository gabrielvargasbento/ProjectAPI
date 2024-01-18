//
//  APIServiceMock.swift
//  ProjectAPITests
//
//  Created by dti Digital on 17/01/24.
//

import Foundation
@testable import ProjectAPI

struct InfoMock: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
}

class APIServiceMock: APIServiceProtocol {
    typealias T = InfoMock
    var mockData: Data?

    init(mockData: Data) {
        self.mockData = mockData
    }

    func fetchData(from url: URL, completion: @escaping ([T]?, ProviderError?) -> ()) {
        
        if self.mockData != nil {
            do {
                let decodedData = try JSONDecoder().decode([T].self, from: mockData!)
                completion(decodedData, nil)
            } catch {
                completion(nil, .decodingFailed)
            }
        } else {
            completion(nil, .noData)
        }
    }
}
