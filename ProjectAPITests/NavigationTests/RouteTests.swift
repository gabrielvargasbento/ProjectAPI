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
                
                it("should incorrectly hash and compare different cases") {
                    
                    let route1 = Route.repositoryMenu
                    let route2 = Route.harryPotterMenu
                    
                    expect(route1).notTo(equal(route2))
                }
            }
            
            context("Test View ") {
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

                    let item = repository
                    let view = Route.repositoryItem(item: repository)

                    XCTAssertTrue(view.body is AccountView, "Expected view.body to be an instance of AccountView")

                    let route = Route.repositoryItem(item: item)
                    let view1 = try? route.inspect().view(AccountView.self)

                    expect(view1).toNot(beNil())
                }

                
                it("should display CharacterView for harryPotterItem case") {
                    
                    let harryPotter = HarryPotter(
                        id: "1",
                        name: "Harry Potter",
                        house: nil,
                        dateOfBirth: nil,
                        actor: nil,
                        image: nil)
                    
                    let item = harryPotter
                    let route = Route.harryPotterItem(item: item)
                    let view = try? route.inspect().view(CharacterView.self)
                    
                    expect(view).notTo(beNil())
                }
                
                it("should display ListHarryPotterView for harryPotterMenu case") {
                    let route = Route.harryPotterMenu
                    let view = try? route.inspect().view(ListHarryPotterView.self)
                    
                    expect(view).notTo(beNil())
                }
                
                it("should display ListRepositoriesView for repositoryMenu case") {
                    let route = Route.repositoryMenu
                    let view = try? route.inspect().view(ListRepositoriesView.self)
                    
                    expect(view).to(beAKindOf(ListRepositoriesView.self))
                    
                }
            }
        }
    }
}
