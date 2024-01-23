//
//  RouteFinderTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 23/01/24.
//

import Quick
import Nimble
@testable import ProjectAPI

class RouteFinderTests: QuickSpec {
    
    override class func spec() {
        describe("Route Finder Tests") {
            
            var sut: RouteFinder!
            
            beforeEach {
                sut = RouteFinder()
            }
            
            afterEach {
                sut = nil
            }
            
            context("Test Func Find") {
                
                it("URL Without Host") {
                
                    sut.find
                    
                }
            }

        }
    }
}
