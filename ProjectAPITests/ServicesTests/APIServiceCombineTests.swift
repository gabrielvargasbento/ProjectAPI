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

class APIServiceCombineTests: QuickSpec {
    
    override class func spec() {
        describe("API Service Tests") {
            var sut: APIServiceCombine<MockModel>!
            
            beforeEach {
                sut = APIServiceCombine<MockModel>()
            }
            
            afterEach {
                sut = nil
            }
            
            context("Verify Protocols") {
                
                it("ObservableObject APIService") {
                    expect(sut).to(beAKindOf((any ObservableObject).self))
                }
                
                it("RandomAccessCollection APIService") {
                    expect(sut).to(beAKindOf((any RandomAccessCollection).self))
                }
                
                it("APIServiceCombineProtocol APIService") {
                    expect(sut).to(beAKindOf((any APIServiceCombineProtocol).self))
                }
            }
            
            context("Fetch Data") {
                
                beforeEach {
                    URLProtocolMock.unregisterMockURL()
                }
                
                //limit=20&offset=50
                
                it("Decode apiList correctly with valid data") {
                    let mockURLString = "https://example.com/mock"
                    let mockData = """
                        {"id": 1, "name": "item1"}
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
                    waitUntil { done in
                        let mockURL = URL(string: mockURLString)!
                        
                        sut.fetchData(from: mockURL)
                        
                        // Verificar ausencia de erro
                        expect(sut.error).to(beNil())
                        expect(sut.hasError).to(beFalse())
                        
                        // Verififcar presenca de dados
                        expect(sut.apiListItem).toNot(beNil())
                        expect(sut.apiListItem?.id) == 1
                        expect(sut.apiListItem?.name).to(equal("item1"))
                        
                        done()
                        
                    }
                }
            }
            
        }
    }
    
}
