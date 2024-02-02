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
            var app = XCUIApplication()
            app.launch()
            
            beforeEach {
                
                let loginButtonPage = app.tabBars["Login"]
                expect(loginButtonPage).toNot(beNil())
                XCTAssertTrue(loginButtonPage.exists)
                loginButtonPage.tap()
                
            }
            
            context("Verify Title") {
                
                it("Login Page Title") {
                    let titleLogin = app.staticTexts["Login"]
                    expect(titleLogin).toNot(beNil())
                    XCTAssertTrue(titleLogin.exists)
                }
            }
            
            context("Sign Up") {
                
                it("Success Sign Up") {
                    let emailField = app.textFields["Email"]
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText("gabriel@email.com")
                    
                    let passwordField = app.textFields["Password"]
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText("Password123")
                    
                    let signUpButton = app.buttons["Sign Up"]
                    XCTAssertTrue(signUpButton.exists)
                    signUpButton.tap()
                }
                
                it("Faill Sign Up") {
                }
            }
            
            context("Sign Up and Login") {
                
                it("Success Login") {
                    let emailField = app.textFields["Email"]
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText("gabriel@email.com")
                    
                    let passwordField = app.textFields["Password"]
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText("Password123")
                    
                    let signUpButton = app.buttons["Sign Up"]
                    XCTAssertTrue(signUpButton.exists)
                    signUpButton.tap()
                    
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText("gabriel@email.com")
                    
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText("Password123")
                    
                    let loginButton = app.buttons["Login"]
                    XCTAssertTrue(loginButton.exists)
                    loginButton.tap()
                    
                    let loginLabel = app.staticTexts["You are logged in, gabriel"]
                    XCTAssertTrue(loginLabel.exists)
                }
                
                it("Fail Login") {
                }
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
