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
