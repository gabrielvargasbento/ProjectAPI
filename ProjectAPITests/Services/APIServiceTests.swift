//
//  APIServiceTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 18/01/24.
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

            context("Fetch data") {
                
                it("Decode apiList correctly with valid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": 1, "name": "item1"}, {"id": 2, "name": "item2"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData)
                    
                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchData(from: mockURL) { (items, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca de dados
                            expect(items).toNot(beNil())
                            expect(sut.apiList.count) == 2
                            
                            // Verificar decodificacao dos dados
                            expect(sut.apiList[0].id).to(equal(1))
                            expect(sut.apiList[0].name).to(equal("item1"))
                            expect(sut.apiList[1].id).to(equal(2))
                            expect(sut.apiList[1].name).to(equal("item2"))
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiList with no data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData: Data? = nil

                    URLProtocolMock.registerMockURL(mockURLString, with: mockData)

                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchData(from: mockURL) { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            expect(error).to(beAKindOf(DecodingError.self))
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.apiList.count) == 0
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiList with invalid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": 1, "error": "item1"}, {"id": 2, "name": "item2"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData)

                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchData(from: mockURL) { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            expect(error).to(beAKindOf(DecodingError.self))
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.apiList.count) == 0
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiList with invalid url") {
                    let fakeURLString = "https://example.com/fake"

                    waitUntil { done in
                        let mockURL = URL(string: fakeURLString)!
                        sut.fetchData(from: mockURL) { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            expect(error).to(beAKindOf(DecodingError.self))
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.apiList.count) == 0
                            
                            done()
                        }
                    }
                }
            }
            
            afterEach {
                sut = nil
                URLProtocolMock.unregisterMockURL()
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
    static var mockURL: URL?
    static var mockData: Data?
    
    class func registerMockURL(_ urlString: String, with data: Data?) {
        mockURL = URL(string: urlString)
        mockData = data ?? nil
        URLProtocol.registerClass(self)
    }
    
    class func unregisterMockURL() {
        mockURL = nil
        mockData = nil
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
        if let mockData = URLProtocolMock.mockData {
            self.client?.urlProtocol(self, didLoad: mockData)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
