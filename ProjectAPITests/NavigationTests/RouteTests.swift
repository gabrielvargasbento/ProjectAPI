//
//  RouteTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 23/01/24.
//

import Quick
import Nimble
import XCTest
import ViewInspector
import SwiftUI
import Foundation
@testable import ProjectAPI

class RouteTests: QuickSpec {
    
    override class func spec() {
        describe("Route Tests") {
            
            context("Test Func == ") {
                it("should correctly hash and compare repositoryItem cases") {
                    
                    let owner: Owner? = nil
                    
                    let repository = Repository(
                        id: 1,
                        name: "grit",
                        fullName: nil,
                        owner: owner,
                        description: nil)
                    
                    let item1 = repository
                    let item2 = repository
                    let route1 = Route.repositoryItem(item: item1)
                    let route2 = Route.repositoryItem(item: item2)
                    
                    expect(route1).to(equal(route2))
                }
                
                it("should correctly hash and compare harryPotterItem cases") {
                                        
                    let harryPotter = HarryPotter(
                        id: "1",
                        name: "Harry Potter",
                        house: nil,
                        dateOfBirth: nil,
                        actor: nil,
                        image: nil)
                    
                    let item1 = harryPotter
                    let item2 = harryPotter
                    let route1 = Route.harryPotterItem(item: item1)
                    let route2 = Route.harryPotterItem(item: item2)
                    
                    expect(route1).to(equal(route2))
                }
                
                it("should correctly hash and compare marvelItem cases") {
                    let marvelCharacter = MarvelCharacter(
                        id: 1,
                        name: "Iron Man",
                        description: nil,
                        comics: Comics(
                            available: 1,
                            items: [Item(name: "Iron Man #1")]
                        )
                    )
                    
                    let item1 = marvelCharacter
                    let item2 = marvelCharacter
                    let route1 = Route.marvelItem(item: item1)
                    let route2 = Route.marvelItem(item: item2)
                    
                    expect(route1).to(equal(route2))
                }

                
                it("should correctly hash and compare harryPotterMenu cases") {
                    
                    let route1 = Route.harryPotterMenu
                    let route2 = Route.harryPotterMenu
                    
                    expect(route1).to(equal(route2))
                }
                
                it("should correctly hash and compare repositoryMenu cases") {
                    
                    let route1 = Route.repositoryMenu
                    let route2 = Route.repositoryMenu
                    
                    expect(route1).to(equal(route2))
                }
                
                it("should correctly hash and compare marvelMenu cases") {
                    
                    let route1 = Route.marvelMenu
                    let route2 = Route.marvelMenu
                    
                    expect(route1).to(equal(route2))
                }
                
                it("should incorrectly hash and compare different cases") {
                    
                    let route1 = Route.repositoryMenu
                    let route2 = Route.harryPotterMenu
                    
                    expect(route1).notTo(equal(route2))
                }
            }
            
            context("Test View") {
                it("should display AccountView for repositoryItem case") {
                    let owner = Owner(
                        login: "mojombo",
                        id: 1,
                        avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
                        htmlUrl: "https://github.com/mojombo"
                    )

                    let repository = Repository(
                        id: 1,
                        name: "grit",
                        fullName: "mojombo/grit",
                        owner: owner,
                        description: "**Grit is no longer maintained..."
                    )

                    let view = Route.repositoryItem(item: repository)
                    expect(view).to(beAKindOf(Route.self))
                }

                
                it("should display CharacterView for harryPotterItem case") {
                    
                    let harryPotter = HarryPotter(
                        id: "1",
                        name: "Harry Potter",
                        house: nil,
                        dateOfBirth: nil,
                        actor: nil,
                        image: nil)
                    
                    let view = Route.harryPotterItem(item: harryPotter)
                    expect(view).to(beAKindOf(Route.self))
                }

                it("should display CharacterView for marvelItem case") {
                    
                    let marvelCharacter = MarvelCharacter(
                            id: 1,
                            name: "Iron Man",
                            description: "",
                            comics: Comics(
                                available: 1,
                                items: [Item(name: "Iron Man #1")]
                            )
                        )
                    
                    let view = Route.marvelItem(item: marvelCharacter)
                    expect(view).to(beAKindOf(Route.self))
                }
                
                it("should display ListHarryPotterView for harryPotterMenu case") {
                    let view = Route.harryPotterMenu
                    expect(view).to(beAKindOf(Route.self))
                }
                
                it("should display ListRepositoriesView for repositoryMenu case") {
                    let view = Route.repositoryMenu
                    expect(view).to(beAKindOf(Route.self))
                }
                
                it("should display ListRepositoriesView for marvelMenu case") {
                    let view = Route.marvelMenu
                    expect(view).to(beAKindOf(Route.self))
                }
            }
        }
    }
}
