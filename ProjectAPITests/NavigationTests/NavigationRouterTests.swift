//
//  NavigationRouterTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 23/01/24.
//

import Quick
import Nimble
@testable import ProjectAPI
import Foundation

class NavigationRouterTests: QuickSpec {
    
    override class func spec() {
                
        describe("Navigation Router Tests") {
            
            var sut: NavigationRouter!
            
            beforeEach {
                sut = NavigationRouter()
            }
            
            afterEach {
                sut = nil
            }
            
            context("Test Func Push") {
                it("Add a route to the routes array") {
                    
                    let route1 = Route.repositoryMenu
                    let route2 = Route.harryPotterMenu
                    
                    sut.push(to: route1)
                    sut.push(to: route2)
                    
                    expect(sut.routes).to(contain(route1))
                    expect(sut.routes).to(contain(route2))
                }
                
                it("Not add duplicate routes") {
                    
                    let route = Route.repositoryMenu
                    
                    sut.push(to: route)
                    sut.push(to: route)
                    
                    expect(sut.routes.count).to(equal(1))
                }
            }
            
            context("Test Func Reset") {
                it("Clear all the routes array") {
                    
                    sut.routes = [Route.repositoryMenu, Route.harryPotterMenu]
                    sut.reset()
                    
                    expect(sut.routes).to(beEmpty())
                }
            }
        }
    }
}
