//
//  HarryPotterTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 15/01/24.
//

import Quick
import Nimble
@testable import ProjectAPI

final class HarryPotterTests: QuickSpec {
    
    override class func spec() {
        describe("HarryPotter Model Tests") {
            
            var harryPotter: HarryPotter?
            
            context("Is A Valid HarryPotter") {
                
                beforeEach {
                    harryPotter = HarryPotter(
                        id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
                        name: "Harry Potter",
                        house: "Gryffindor",
                        dateOfBirth: "31-07-1980",
                        actor: "Daniel Radcliffe",
                        image: "https://ik.imagekit.io/hpapi/harry.jpg")
                }
                
                it("Get HarryPotter Atributes") {
                    expect(harryPotter?.id).to(equal("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"))
                    expect(harryPotter?.name).to(equal("Harry Potter"))
                    expect(harryPotter?.house).to(equal("Gryffindor"))
                    expect(harryPotter?.dateOfBirth).to(equal("31-07-1980"))
                    expect(harryPotter?.actor).to(equal("Daniel Radcliffe"))
                    expect(harryPotter?.image).to(equal("https://ik.imagekit.io/hpapi/harry.jpg"))
                }
                
                it("Codable HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any Codable).self))
                }
                
                it("Hashable HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any Hashable).self))
                }
                
                it("Identifiable HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any Identifiable).self))
                }
                
                it("HarryPotterItem HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any HarryPotterItem).self))
                }
                
                afterEach {
                    harryPotter = nil
                }
            }
            
            context("Is A Valid HarryPotter with null value") {
                
                beforeEach {
                    harryPotter = HarryPotter(
                        id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
                        name: nil,
                        house: nil,
                        dateOfBirth: nil,
                        actor: nil,
                        image: nil)
                }
                
                it("Get HarryPotter Atributes") {
                    expect(harryPotter?.id).to(equal("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"))
                    expect(harryPotter?.name).to(beNil())
                    expect(harryPotter?.house).to(beNil())
                    expect(harryPotter?.dateOfBirth).to(beNil())
                    expect(harryPotter?.actor).to(beNil())
                    expect(harryPotter?.image).to(beNil())
                }
                
                it("Codable HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any Codable).self))
                }
                
                it("Hashable HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any Hashable).self))
                }
                
                it("Identifiable HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any Identifiable).self))
                }
                
                it("HarryPotterItem HarryPotter") {
                    expect(harryPotter).to(beAKindOf((any HarryPotterItem).self))
                }
                
                afterEach {
                    harryPotter = nil
                }
            }
            
            context("Is A Invalid HarryPotter") {
                
                beforeEach {
                    harryPotter = nil
                }
                
                it("Get HarryPotter Atributes") {
                    expect(harryPotter?.id).to(beNil())
                    expect(harryPotter?.name).to(beNil())
                    expect(harryPotter?.house).to(beNil())
                    expect(harryPotter?.dateOfBirth).to(beNil())
                    expect(harryPotter?.actor).to(beNil())
                    expect(harryPotter?.image).to(beNil())
                }

                afterEach {
                    harryPotter = nil
                }
            }
        }
    }
}
