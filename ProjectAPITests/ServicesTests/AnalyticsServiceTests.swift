//
//  AnalyticsServiceTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 19/01/24.
//

import Quick
import Nimble
@testable import ProjectAPI

final class AnalyticsServiceTests: QuickSpec {
    
    override class func spec() {
        describe("Analytics Service Tests") {
            
            var sut: AnalyticsService!
            
            beforeEach {
                sut = AnalyticsService()
            }
            
            context("Func Analytics Screen Event") {
                
                it("Add Screen Event in Firebase") {
                    expect(sut.analytics(userName: "Name Test", className: "Class Test")).to(beVoid())
                }
            }
            
            context("Func Analytics Button Event") {
                
                it("Add Screen Event in Firebase") {
                    expect(sut.buttonEvent(buttonName: "Button Name Test")).to(beVoid())
                }
            }
            
            afterEach {
                sut = nil
            }
        }
    }
}
