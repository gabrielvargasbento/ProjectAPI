//
//  Mock.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 16/02/24.
//

import Foundation

// Mock model for testing
struct MockModel: Decodable {
    let id: Int
    let name: String
}

class URLProtocolMock: URLProtocol {
    static var mockURL: URL?
    static var mockData: Data?
    static var mockError: Error?
    
    class func registerMockURL(_ urlString: String, with data: Data?, with error: Error?) {
        mockURL = URL(string: urlString)
        mockData = data ?? nil
        mockError = error ?? nil
        URLProtocol.registerClass(self)
    }
    
    class func unregisterMockURL() {
        mockURL = nil
        mockData = nil
        mockError = nil
        URLProtocol.unregisterClass(self)
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        guard let mockURL = mockURL else { return false }
        return request.url == mockURL
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let mockError = URLProtocolMock.mockError {
            client?.urlProtocol(self, didFailWithError: mockError)
            return
        }
        
        if let mockData = URLProtocolMock.mockData {
            self.client?.urlProtocol(self, didLoad: mockData)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
