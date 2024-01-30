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

            context("when requesting authorization") {
                it("should set hasPermission to true") {
                    
//                    waitUntil { done in
//                        try! await notificationService.request()
//                        expect(notificationService.hasPermission) == true
//                        
//                        done()
//                    }
                }
            }

            context("when getting authorization status") {
                it("should set hasPermission to true for authorized status") {
                    
                    //UNUserNotificationCenter.current().setNotificationSettings(.authorized)
                    
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in}
                    
//                    waitUntil { done in
//                        try! await notificationService.getAuthStatus()
//                        expect(notificationService.hasPermission) == true
//                        
//                        done()
//                    }
                }

                it("should set hasPermission to false for other authorization statuses") {
                    
                    //UNUserNotificationCenter.current().setNotificationSettings(.denied)
                    
                    UNUserNotificationCenter.current().getNotificationSettings { settings in}
//                    waitUntil { done in
//                        
//                        try! await notificationService.getAuthStatus()
//                        expect(notificationService.hasPermission) == false
//                        
//                        done()
//                    }
                }
            }
        }
    }
}

