//
//  MarvelCharacterTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 15/01/24.
//

import Quick
import Nimble
import XCTest
@testable import ProjectAPI

final class MarvelCharacterTests: QuickSpec {
    
    override class func spec() {
        describe("Marvel Character Model Tests") {
            
            var wrapperMarvel: CharacterDataWrapperMarvel?
            var data: DataMarvel?
            var marvelChar: MarvelCharacter?
            var comics: Comics?
            var item: Item?
            
            context("Is A Valid Marvel Character") {
                
                beforeEach {
                    
                    item = Item(name: "Comic1")
                    comics = Comics(available: 1, items: [item!])
                    marvelChar = MarvelCharacter(id: 1,
                                                 name: "name1",
                                                 description: "description1",
                                                 comics: comics)
                    data = DataMarvel(results: [marvelChar!])
                    wrapperMarvel = CharacterDataWrapperMarvel(data: data!)
                }
                
                it("Get Marvel Character Atributes") {
                    expect(marvelChar?.id).to(equal(1))
                    expect(marvelChar?.name).to(equal("name1"))
                    expect(marvelChar?.description).to(equal("description1"))
                    expect(marvelChar?.comics?.available).to(equal(1))
                    expect(marvelChar?.comics?.items?[0].name).to(equal("Comic1"))
                }
                
                it("Decodable Item") {
                    expect(item).to(beAKindOf((any Decodable).self))
                }
                
                it("Decodable Comics") {
                    expect(comics).to(beAKindOf((any Decodable).self))
                }
                
                it("Decodable MarvelChar") {
                    expect(marvelChar).to(beAKindOf((any Decodable).self))
                }
                
                it("Identifiable MarvelChar") {
                    expect(marvelChar).to(beAKindOf((any Identifiable).self))
                }
                
                it("Decodable DataMarvel") {
                    expect(data).to(beAKindOf((any Decodable).self))
                }
                
                it("Decodable CharacterDataWrapperMarvel") {
                    expect(wrapperMarvel).to(beAKindOf((any Decodable).self))
                }
                
                afterEach {
                    item = nil
                    comics = nil
                    marvelChar = nil
                    data = nil
                    wrapperMarvel = nil
                }
            }
            
            context("Is A Valid Marvel Character with null value") {
                
                beforeEach {
                    marvelChar = MarvelCharacter(id: 1,
                                                 name: nil,
                                                 description: nil,
                                                 comics: nil)
                }
                
                it("Get Repository Atributes") {
                    expect(marvelChar?.id).to(equal(1))
                    expect(marvelChar?.name).to(beNil())
                    expect(marvelChar?.description).to(beNil())
                }
                
                afterEach {
                    marvelChar = nil
                }
            }
            
            context("Is A Invalid Marvel Character") {
                
                beforeEach {
                    marvelChar = nil
                }
                
                it("Get Repository Atributes") {
                    expect(marvelChar?.id).to(beNil())
                    expect(marvelChar?.name).to(beNil())
                    expect(marvelChar?.description).to(beNil())
                }
                
                afterEach {
                    marvelChar = nil
                }
            }
        }
    }
    
}
