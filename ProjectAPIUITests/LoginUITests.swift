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
            
            let loginEmail = ProcessInfo.processInfo.environment["LOGIN_EMAIL"] ?? ""
            let passwordEmail = ProcessInfo.processInfo.environment["PASSWORD_EMAIL"] ?? ""
            let loginGoogle = ProcessInfo.processInfo.environment["LOGIN_GOOGLE"] ?? ""
            let passwordGoogle = ProcessInfo.processInfo.environment["PASSWORD_GOOGLE"] ?? ""
            let loginGitHub = ProcessInfo.processInfo.environment["LOGIN_GITHUB"] ?? ""
            let passwordGitHub = ProcessInfo.processInfo.environment["PASSWORD_GITHUB"] ?? ""
            let loginMicrosoft = ProcessInfo.processInfo.environment["LOGIN_MICROSOFT"] ?? ""
            let passwordMicrosoft = ProcessInfo.processInfo.environment["PASSWORD_MICROSOFT"] ?? ""
            
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
//            
//            context("Register") {
//                
//                it("Success Register") {
//                    let emailField = app.textFields["Email"]
//                    XCTAssertTrue(emailField.exists)
//                    emailField.tap()
//                    emailField.typeText("gabriel@email.com")
//                    
//                    let passwordField = app.secureTextFields["Password"]
//                    XCTAssertTrue(passwordField.exists)
//                    passwordField.tap()
//                    passwordField.typeText("Password123")
//                    
//                    let signUpButton = app.buttons["Register"]
//                    XCTAssertTrue(signUpButton.exists)
//                    signUpButton.tap()
//                }
//                
//                it("Faill Register") {}
//            }
//            
//            context("Register and Sign In") {
//                
//                it("Success Login") {
//                    let emailField = app.textFields["Email"]
//                    XCTAssertTrue(emailField.exists)
//                    emailField.tap()
//                    emailField.typeText("gabrielvargas@email.com")
//                    
//                    let passwordField = app.secureTextFields["Password"]
//                    XCTAssertTrue(passwordField.exists)
//                    passwordField.tap()
//                    passwordField.typeText("Password123")
//                    
//                    let signUpButton = app.buttons["Register"]
//                    XCTAssertTrue(signUpButton.exists)
//                    signUpButton.tap()
//                    
////                    XCTAssertTrue(emailField.exists)
////                    emailField.tap()
//////                    emailField.clear()
//////                    emailField.typeText("gabriel@email.com")
////                    
////                    XCTAssertTrue(passwordField.exists)
////                    passwordField.tap()
//////                    passwordField.clear()
////                    passwordField.typeText("Password123")
//                    
//                    let loginButton = app.buttons["Sign In"]
//                    XCTAssertTrue(loginButton.exists)
//                    loginButton.tap()
//                    
//                    let loginLabel = app.staticTexts["You are logged in, gabrielvargas"]
//                    XCTAssertTrue(loginLabel.exists)
//                    
//                    let logoutButton = app.staticTexts["Logout"]
//                    expect(logoutButton).toNot(beNil())
//                }
//                
//                it("Fail Register and Sign In") {}
//            }
//            
//            context("Sign In With Google") {
//                
//                it("Login") {
//                    
//                    let loginGoogleButton = app/*@START_MENU_TOKEN@*/.buttons["GIDSignInButton"]/*[[".buttons[\"Sign in with Google\"]",".buttons[\"GIDSignInButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//                    XCTAssertTrue(loginGoogleButton.exists)
//                    loginGoogleButton.tap()
//                }
//            }
//            
            context("Sign In With GitHub") {
                
                it("Login") {
                  
                    let loginGitHubButton = app.buttons["Sign in with GitHub"]
                    XCTAssertTrue(loginGitHubButton.exists)
                    loginGitHubButton.tap()
                    
                    let emailField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .textField).element
                    sleep(2)
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText(loginGitHub)
                    
                    let passwordField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .secureTextField).element
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText(passwordGitHub)
                    
                    let signInButton = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Sign in"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"]",".otherElements[\"main\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
                    XCTAssertTrue(signInButton.exists)
                    signInButton.tap()
                    
                    let notNowButton = app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"Would you like to save this password to use with apps and websites?\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons["Not Now"]
                    XCTAssertTrue(notNowButton.exists)
                    notNowButton.tap()
                }
            }
            
//            context("Sign In With Microsoft") {
//                
//                it("Login") {
//                    
//                    let loginGitHubButton = app.buttons["Sign in with Microsoft"]
//                    XCTAssertTrue(loginGitHubButton.exists)
//                    loginGitHubButton.tap()
//                    
//                    let emailField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .textField).element
//                    sleep(2)
//                    XCTAssertTrue(emailField.exists)
//                    emailField.tap()
//                    emailField.typeText(loginMicrosoft)
//                    
//                    let passwordField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .secureTextField).element
//                    XCTAssertTrue(passwordField.exists)
//                    passwordField.tap()
//                    passwordField.typeText(passwordMicrosoft)
//
//                    let signInButton = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Sign in"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"]",".otherElements[\"main\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
//                    XCTAssertTrue(signInButton.exists)
//                    signInButton.tap()
//                    
//                    let notNowButton = app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"Would you like to save this password to use with apps and websites?\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons["Not Now"]
//                    XCTAssertTrue(notNowButton.exists)
//                    notNowButton.tap()
//                }
//            }
            
        }
    }
}
