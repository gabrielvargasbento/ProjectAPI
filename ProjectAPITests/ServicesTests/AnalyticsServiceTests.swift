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
            
            var analyticsService: AnalyticsService!
            var mockFirebaseAnalytics: MockFirebaseAnalytics!
            
            context("Test with Mock Firebase") {
                
                beforeEach {
                    mockFirebaseAnalytics = MockFirebaseAnalytics()
                    analyticsService = AnalyticsService(firebaseAnalytics: mockFirebaseAnalytics)
                }
                
                it("Test analytics") {
                    analyticsService.analytics(userName: "TestUser", className: "TestClass")
                    
                    expect(mockFirebaseAnalytics.loggedParameters?["screen_name"] as? String).to(equal("TestUser"))
                    expect(mockFirebaseAnalytics.loggedParameters?["screen_class"] as? String).to(equal("TestClass"))
                    expect(mockFirebaseAnalytics.loggedParameters?["origin"] as? String).to(equal("Gabriel Vargas"))
                }
                
                it("Test buttonEvent") {
                    analyticsService.buttonEvent(buttonName: "TestButton")

                    expect(mockFirebaseAnalytics.loggedEvent).to(equal("button_clicked"))
                    expect(mockFirebaseAnalytics.loggedParameters?["button_name"] as? String).to(equal("TestButton"))
                }
                
            }
            
        }
    }
}




class MockFirebaseAnalytics: FirebaseAnalytics {
    var loggedEvent: String?
    var loggedParameters: [String: Any]?

    func logEvent(_ name: String, parameters: [String: Any]?) {
        loggedEvent = name
        loggedParameters = parameters
    }
}
