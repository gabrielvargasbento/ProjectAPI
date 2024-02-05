//
//  NotificationUITests.swift
//  ProjectAPIUITests
//
//  Created by Gabriel Vargas on 01/02/24.
//

import Quick
import Nimble
import XCTest

class NotificationUITests: QuickSpec {
    
    override class func spec() {
        describe("Notification UI Tests") {
            
            // Instanciar app
            let app = XCUIApplication()
            app.launch()
            
            beforeEach {
                
                app.launch()
                let tabBar = app.tabBars["Tab Bar"]
                let loginButtonPage = tabBar.buttons["Notification"]
                loginButtonPage.tap()
                
            }
            
        }
    }
}
