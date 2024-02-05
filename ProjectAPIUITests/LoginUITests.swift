//
//  LoginUITests.swift
//  ProjectAPIUITests
//
//  Created by dti Digital on 14/12/23.
//

import Quick
import Nimble
import XCTest

final class LoginUITests: QuickSpec {
    
    override class func spec() {
        describe("Login UI Tests") {
            
            // Instanciar app
            let app = XCUIApplication()
            app.launch()
            
            beforeEach {
                
                app.launch()
                let tabBar = app.tabBars["Tab Bar"]
                let loginButtonPage = tabBar.buttons["Login"]
                loginButtonPage.tap()
                
            }
            
            context("Verify Title") {
                
                it("Login Page Title") {
                    let titleLogin = app.staticTexts["Login Page"]
                    expect(titleLogin).toNot(beNil())
                    XCTAssertTrue(titleLogin.exists)
                }
            }
            
            context("Register") {
                
                it("Success Register") {
                    let emailField = app.textFields["Email"]
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText("gabriel@email.com")
                    
                    let passwordField = app.secureTextFields["Password"]
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText("Password123")
                    
                    let signUpButton = app.buttons["Register"]
                    XCTAssertTrue(signUpButton.exists)
                    signUpButton.tap()
                }
                
                it("Faill Register") {
                }
            }
            
            context("Register and Sign In") {
                
                it("Success Login") {
                    let emailField = app.textFields["Email"]
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText("gabrielvargas@email.com")
                    
                    let passwordField = app.secureTextFields["Password"]
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText("Password123")
                    
                    let signUpButton = app.buttons["Register"]
                    XCTAssertTrue(signUpButton.exists)
                    signUpButton.tap()
                    
//                    XCTAssertTrue(emailField.exists)
//                    emailField.tap()
////                    emailField.clear()
////                    emailField.typeText("gabriel@email.com")
//                    
//                    XCTAssertTrue(passwordField.exists)
//                    passwordField.tap()
////                    passwordField.clear()
//                    passwordField.typeText("Password123")
                    
                    let loginButton = app.buttons["Sign In"]
                    XCTAssertTrue(loginButton.exists)
                    loginButton.tap()
                    
                    let loginLabel = app.staticTexts["You are logged in, gabrielvargas"]
                    XCTAssertTrue(loginLabel.exists)
                    
                    let logoutButton = app.staticTexts["Logout"]
                    expect(logoutButton).toNot(beNil())
                }
                
                it("Fail Register and Sign In") {
                }
            }
            
            context("Sign In With Google") {
                
            }
            
        }
    }
}



//func testLaunchPerformance() throws {
//    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//        // This measures how long it takes to launch your application.
//        measure(metrics: [XCTApplicationLaunchMetric()]) {
//            XCUIApplication().launch()
//        }
//    }
//}


// .accessibilityIdentifier("Name_here")
