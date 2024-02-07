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
            
            context("Verify Protocols") {
                
                it("ObservableObject APIService") {
                    expect(sut).to(beAKindOf((any ObservableObject).self))
                }
                
                it("RandomAccessCollection APIService") {
                    expect(sut).to(beAKindOf((any RandomAccessCollection).self))
                }
                
                it("APIServiceProtocol APIService") {
                    expect(sut).to(beAKindOf((any APIServiceProtocol).self))
                }
            }
            
            context("Access API List"){
                
                let mock0 = MockModel(id: 0, name: "item0")
                let mock1 = MockModel(id: 1, name: "item1")
                let mock2 = MockModel(id: 2, name: "item2")
                
                beforeEach {
                    sut.apiList = [mock0, mock1, mock2]
                }
                
                it("Verify StartIndex API List") {
                    expect(sut.startIndex).to(equal(0))
                }
                
                it("Verify EndIndex API List") {
                    expect(sut.endIndex).to(equal(3))
                }
                
                it("Verify Index API List") {
                    expect(sut.index(after: 0)).to(equal(1))
                }
                
                it("Verify Subscript API List") {
                    expect(sut.apiList[0].id).to(equal(mock0.id))
                }
                
                afterEach {
                    sut.apiList = []
                }
            }
            
            context("Fetch Data") {
                
                beforeEach {
                    URLProtocolMock.unregisterMockURL()
                }
                
                it("Decode apiList correctly with valid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": 1, "name": "item1"}, {"id": 2, "name": "item2"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
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
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
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
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
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
                
                it("Decode apiList with response error") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                            [{"id": 1, "error": "item1"}, {"id": 2, "name": "item2"}]
                        """.data(using: .utf8)!
                    
                    let mockError = NSError(domain: "Project API", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
                    
                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchData(from: mockURL) { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.apiList.count) == 0
                            
                            done()
                        }
                    }
                }
                
                afterEach {
                    URLProtocolMock.unregisterMockURL()
                }
            }
            
            context("Fetch Data Item") {
                
                beforeEach {
                    URLProtocolMock.unregisterMockURL()
                }
                
                it("Decode apiItem correctly with valid data struct") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        {"id": 1, "name": "item1"}
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)

                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchDataItem(from: mockURL) { (item, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca de dados
                            expect(item).toNot(beNil())
                            
                            // Verificar decodificacao dos dados
                            expect(sut.apiItem?.id).to(equal(1))
                            expect(sut.apiItem?.name).to(equal("item1"))
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiItem correctly with a valid data array") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": 1, "name": "item1"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)

                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchDataItem(from: mockURL) { (item, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca de dados
                            expect(item).toNot(beNil())
                            
                            // Verificar decodificacao dos dados
                            expect(sut.apiItem?.id).to(equal(1))
                            expect(sut.apiItem?.name).to(equal("item1"))
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiItem correctly with an invalid data array") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        []
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)

                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchDataItem(from: mockURL) { (item, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia de dados
                            expect(item).to(beNil())
                            
                            // Verificar ausencia de dados
                            expect(sut.apiItem?.id).to(beNil())
                            expect(sut.apiItem?.name).to(beNil())
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiItem with invalid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": 1, "error": "item1"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)

                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchDataItem(from: mockURL) { (item, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            expect(error).to(beAKindOf(DecodingError.self))
                            
                            // Verififcar ausencia de dados
                            expect(item).to(beNil())
                            
                            done()
                        }
                    }
                }
                
                it("Decode apiItem with error") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        {"id": 1, "name": "item1"}
                    """.data(using: .utf8)!
                    
                    let mockError = NSError(domain: "Project API", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
                    
                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        sut.fetchDataItem(from: mockURL) { (item, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia de dados
                            expect(item).to(beNil())
                            
                            done()
                        }
                    }
                }
                
                afterEach {
                    URLProtocolMock.unregisterMockURL()
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
