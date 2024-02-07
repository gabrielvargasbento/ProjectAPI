//
//  RepositoriesViewModelTests.swift
//  ProjectAPITests
//
//  Created by Gaberiel Vargas on 19/01/24.
//

import Quick
import Nimble
import Foundation
@testable import ProjectAPI
import XCTest

final class RepositoriesViewModelTests: QuickSpec {
    
//    override class func spec() {
//        describe("Repository View Model Tests") {
//            
//            var sut: RepositoriesViewModel!
//            
//            context("Verify Protocols") {
//                
//                beforeEach {
//                    sut = RepositoriesViewModel()
//                }
//                
//                it("ObservableObject HarryPotter View Model") {
//                    expect(sut).to(beAKindOf((any ObservableObject).self))
//                }
//                
//                it("ViewModelProtocol HarryPotter View Model") {
//                    expect(sut).to(beAKindOf((any ViewModelProtocol).self))
//                }
//                
//                afterEach {
//                    sut = nil
//                }
//            }
//            
//            //            context("Access Repository List"){
//            //
//            //                let mock0 = MockModel(id: 0, name: "item0")
//            //                let mock1 = MockModel(id: 1, name: "item1")
//            //                let mock2 = MockModel(id: 2, name: "item2")
//            //
//            //                beforeEach {
//            //                    sut.repositoryList = [mock0, mock1, mock2]
//            //                }
//            //
//            //                it("Verify StartIndex API List") {
//            //                    expect(sut.startIndex).to(equal(0))
//            //                }
//            //
//            //                it("Verify EndIndex API List") {
//            //                    expect(sut.endIndex).to(equal(3))
//            //                }
//            //
//            //                it("Verify Index API List") {
//            //                    expect(sut.index(after: 0)).to(equal(1))
//            //                }
//            //
//            //                it("Verify Subscript API List") {
//            //                    expect(sut.repositoryList[0].id).to(equal(mock0.id))
//            //                }
//            //
//            //                afterEach {
//            //                    sut.repositoryList = []
//            //                }
//            //            }
//            
//            context("Fetch") {
//                
//                beforeEach {
//                    URLProtocolMock.unregisterMockURL()
//                    sut = nil
//                }
//                
//                afterEach {
//                    URLProtocolMock.unregisterMockURL()
//                    sut = nil
//                }
//                
//                it("Decode repositoryList correctly with valid data") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        [{"id": 1, "name": "item1"}, {"id": 2, "name": "item2"}]
//                    """.data(using: .utf8)!
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetch() { (items, error) in
//                            
//                            // Verificar ausencia de erro
//                            expect(error).to(beNil())
//                            
//                            // Verififcar presenca de dados
//                            expect(items).toNot(beNil())
//                            expect(sut.repositoryList.count) == 2
//                            
//                            // Verificar decodificacao dos dados
//                            expect(sut.repositoryList[0].id).to(equal(1))
//                            expect(sut.repositoryList[0].name).to(equal("item1"))
//                            expect(sut.repositoryList[1].id).to(equal(2))
//                            expect(sut.repositoryList[1].name).to(equal("item2"))
//                            
//                            done()
//                        }
//                    }
//                }
//                
//                it("Decode repositoryList with no data") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData: Data? = nil
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetch() { (items, error) in
//                            
//                            // Verificar presenca de erro
//                            expect(error).toNot(beNil())
//                            expect(error).to(beAKindOf(DecodingError.self))
//                            
//                            // Verififcar ausencia de dados
//                            expect(items).to(beNil())
//                            expect(sut.repositoryList.count) == 0
//                            
//                            done()
//                        }
//                    }
//                }
//                
//                it("Decode repositoryList with invalid data") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        [{"id": "1", "name": "item1"}, {"id": "2", "name": "item2"}]
//                    """.data(using: .utf8)!
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetch() { (items, error) in
//                            
//                            // Verificar presenca de erro
//                            expect(error).toNot(beNil())
//                            expect(error).to(beAKindOf(DecodingError.self))
//                            
//                            // Verififcar ausencia de dados
//                            expect(items).to(beNil())
//                            expect(sut.repositoryList.count) == 0
//                            
//                            done()
//                        }
//                    }
//                }
//                
//                it("Decode repositoryList with response error") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                            [{"id": 1, "error": "item1"}, {"id": 2, "name": "item2"}]
//                        """.data(using: .utf8)!
//                    
//                    let mockError = NSError(domain: "Project API", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetch() { (items, error) in
//                            
//                            // Verificar presenca de erro
//                            expect(error).toNot(beNil())
//                            
//                            // Verififcar ausencia de dados
//                            expect(items).to(beNil())
//                            expect(sut.repositoryList.count) == 0
//                            
//                            done()
//                        }
//                    }
//                }
//            }
//            
//            context("Fetch Data Item") {
//                
//                beforeEach {
//                    URLProtocolMock.unregisterMockURL()
//                    sut = nil
//                }
//                
//                afterEach {
//                    URLProtocolMock.unregisterMockURL()
//                    sut = nil
//                }
//                
//                it("Decode selectedRepository correctly with valid data struct") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        {"id": 1, "name": "item1"}
//                    """.data(using: .utf8)!
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetchItem(identifier: nil) { (item, error) in
//                            
//                            // Verificar ausencia de erro
//                            expect(error).to(beNil())
//                            
//                            // Verififcar presenca de dados
//                            expect(item).toNot(beNil())
//                            
//                            // Verificar decodificacao dos dados
//                            expect(sut.selectedRepository?.id).to(equal(1))
//                            expect(sut.selectedRepository?.name).to(equal("item1"))
//                            
//                            done()
//                        }
//                    }
//                }
//                
//                it("Decode selectedRepository correctly with a valid data array") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        [{"id": 1, "name": "item1"}]
//                    """.data(using: .utf8)!
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetchItem(identifier: nil) { (item, error) in
//                            
//                            // Verificar ausencia de erro
//                            expect(error).to(beNil())
//                            
//                            // Verififcar presenca de dados
//                            expect(item).toNot(beNil())
//                            
//                            // Verificar decodificacao dos dados
//                            expect(sut.selectedRepository?.id).to(equal(1))
//                            expect(sut.selectedRepository?.name).to(equal("item1"))
//                            
//                            done()
//                        }
//                    }
//                }
//                
//                it("Decode selectedRepository with invalid data") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        [{"error": "item1"}]
//                    """.data(using: .utf8)!
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = RepositoriesViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetchItem(identifier: nil) { (item, error) in
//                            
//                            // Verificar presenca de erro
//                            expect(error).toNot(beNil())
//                            expect(error).to(beAKindOf(DecodingError.self))
//                            
//                            // Verififcar ausencia de dados
//                            expect(item).to(beNil())
//                            
//                            done()
//                        }
//                    }
//                }
//            }
//            
//            afterEach {
//                sut = nil
//            }
//        }
//    }
    
    final class PerformanceTests: XCTestCase {
        
        let metrics: [XCTMetric] = [
            XCTApplicationLaunchMetric(),
            XCTMemoryMetric(),
            XCTCPUMetric(),
            XCTStorageMetric(),
            XCTClockMetric()
        ]
        
        var repositoriesViewModel = RepositoriesViewModel()
        
        func testFetchRepositories() throws {
            measure(metrics: metrics) {
                repositoriesViewModel.fetch() { res,err in }
            }
        }
    }
    
}
