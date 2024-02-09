//
//  HarryPotterViewModelTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 23/01/24.
//

import Quick
import Nimble
import Foundation
@testable import ProjectAPI

final class HarryPotterViewModelTests: QuickSpec {
    
    override class func spec() {
        describe("HarryPotter View Model Tests") {
            
            var sut: HarryPotterViewModel!
            
            context("Verify Protocols") {
                
                beforeEach {
                    sut = HarryPotterViewModel()
                }
                
                it("ObservableObject HarryPotter View Model") {
                    expect(sut).to(beAKindOf((any ObservableObject).self))
                }
                
                it("ViewModelProtocol HarryPotter View Model") {
                    expect(sut).to(beAKindOf((any ViewModelProtocol).self))
                }
                
                afterEach {
                    sut = nil
                }
            }
            
            context("Fetch") {
                
                beforeEach {
                    URLProtocolMock.unregisterMockURL()
                    sut = nil
                }
                
                it("Decode harryPotterList correctly with valid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": "1", "name": "item1"}, {"id": "2", "name": "item2"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
                    
                    waitUntil { done in
                        sut.fetch() { (items, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca de dados
                            expect(items).toNot(beNil())
                            expect(sut.harryPotterList.count) == 2
                            
                            // Verificar decodificacao dos dados
                            expect(sut.harryPotterList[0].id).to(equal("1"))
                            expect(sut.harryPotterList[0].name).to(equal("item1"))
                            expect(sut.harryPotterList[1].id).to(equal("2"))
                            expect(sut.harryPotterList[1].name).to(equal("item2"))
                            
                            done()
                        }
                    }
                }
                
                it("Decode harryPotterList with no data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData: Data? = nil
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
                    
                    waitUntil { done in
                        sut.fetch() { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            expect(error).to(beAKindOf(DecodingError.self))
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.harryPotterList.count) == 0
                            
                            done()
                        }
                    }
                }
                
                it("Decode harryPotterList with invalid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": 1, "name": "item1"}, {"id": 2, "name": "item2"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
                    
                    waitUntil { done in
                        sut.fetch() { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            expect(error).to(beAKindOf(DecodingError.self))
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.harryPotterList.count) == 0
                            
                            done()
                        }
                    }
                }
                
                it("Decode harryPotterList with response error") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                            [{"id": "1", "error": "item1"}, {"id": "2", "name": "item2"}]
                        """.data(using: .utf8)!
                    
                    let mockError = NSError(domain: "Project API", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
                    
                    waitUntil { done in
                        sut.fetch() { (items, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia de dados
                            expect(items).to(beNil())
                            expect(sut.harryPotterList.count) == 0
                            
                            done()
                        }
                    }
                }
                
                afterEach {
                    URLProtocolMock.unregisterMockURL()
                    sut = nil
                }
            }
            
            context("Fetch Data Item") {
                
                beforeEach {
                    URLProtocolMock.unregisterMockURL()
                    sut = nil
                }
                
                it("Decode selectedCharacter correctly with valid data struct") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        {"id": "1", "name": "item1"}
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
                    
                    waitUntil { done in
                        sut.fetchItem(identifier: nil) { (item, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca de dados
                            expect(item).toNot(beNil())
                            
                            // Verificar decodificacao dos dados
                            expect(sut.selectedCharacter?.id).to(equal("1"))
                            expect(sut.selectedCharacter?.name).to(equal("item1"))
                            
                            done()
                        }
                    }
                }
                
                it("Decode selectedCharacter correctly with a valid data array") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        [{"id": "1", "name": "item1"}]
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
                    
                    waitUntil { done in
                        sut.fetchItem(identifier: nil) { (item, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca de dados
                            expect(item).toNot(beNil())
                            
                            // Verificar decodificacao dos dados
                            expect(sut.selectedCharacter?.id).to(equal("1"))
                            expect(sut.selectedCharacter?.name).to(equal("item1"))
                            
                            done()
                        }
                    }
                }
                
//                it("Decode selectedCharacter with invalid data") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        [{"error": "item1"}]
//                    """.data(using: .utf8)!
//                    
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
//                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetchItem(identifier: nil) { (item, error) in
//                            
//                            // Verificar presenca de erro
//                            expect(error).toNot(beNil())
//                            
//                            // Verififcar ausencia de dados
//                            expect(item).to(beNil())
//                            
//                            done()
//                        }
//                    }
//                }
                
//                it("Decode selectedCharacter with error") {
//                    let mockURLString = "https://example.com/mock"
//                    let mockData = """
//                        {"id": "1", "name": "item1"}
//                    """.data(using: .utf8)!
//                    
//                    let mockError = NSError(domain: "Project API", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
//                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
//                    sut = HarryPotterViewModel(url: URL(string:mockURLString)!)
//                    
//                    waitUntil { done in
//                        sut.fetchItem(identifier: nil) { (item, error) in
//                            
//                            // Verificar presenca de erro
//                            expect(error).toNot(beNil())
//                            
//                            // Verififcar ausencia de dados
//                            expect(item).to(beNil())
//                            
//                            done()
//                        }
//                    }
//                }
                
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
