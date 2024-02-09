//
//  NotificationServiceTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 24/01/24.
//

import Quick
import Nimble
import UserNotifications
@testable import ProjectAPI

final class NotificationServiceTests: QuickSpec {
    
    override class func spec() {
        var notificationService: NotificationService!
        
        beforeEach {
            notificationService = NotificationService()
            notificationService.resetStatus()
        }
        
        describe("Notification Service Tests") {
            
            context("Resetting Status") {
                it("Toogle hasPermission") {
                    notificationService.resetStatus()
                    expect(notificationService.hasPermission).to(beFalse())
                }
            }
        }
    }
}

