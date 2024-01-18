//
//  APIServiceTests.swift
//  ProjectAPITests
//
//  Created by dti Digital on 18/01/24.
//

import Quick
import Nimble
import Foundation
@testable import ProjectAPI

class APIServiceTests: QuickSpec {
    
    override class func spec() {
        describe("API Service Tests") {
            var sut: APIService<MockModel>!

            beforeEach {
                sut = APIService<MockModel>()
            }

            context("Fetching data from a valid URL") {
                
                it("Decode apiList correctly") {
                    let mockURL = URL(string: "https://example.com/mock")!
                    //let arrayData =
                    let mockData = """
                        [{"id": 1, "name": "item1"}, {"id": 2, "name": "item1"}]
                    """.data(using: .utf8)!

                    URLProtocolMock.testData = mockData
                    URLProtocolMock.response = HTTPURLResponse(url: mockURL, statusCode: 200, httpVersion: nil, headerFields: nil)

                    waitUntil { done in
                        sut.fetchData(from: mockURL) { (items, error) in
                            expect(error).to(beNil())
                            expect(items).toNot(beNil())
                            expect(sut.apiList.count) == 2
                            done()
                        }
                    }
                }
            }
            
            afterEach {
                sut = nil
            }
            
        }
    }
}

// Mock model for testing
struct MockModel: Decodable {
    let id: Int
    let name: String
}

class URLProtocolMock: URLProtocol {
    static var testData: Data?
    static var response: URLResponse?
    static var error: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let response = URLProtocolMock.response {
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }

        if let data = URLProtocolMock.testData {
            self.client?.urlProtocol(self, didLoad: data)
        }

        if let error = URLProtocolMock.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        }

        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}

