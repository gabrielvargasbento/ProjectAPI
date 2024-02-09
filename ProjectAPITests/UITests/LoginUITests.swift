//
//  LoginUITests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Quick
import Nimble
import Foundation
import XCTest
import FirebaseAuth

@testable import ProjectAPI

final class LoginUITests: QuickSpec {
    
    override class func spec() {
        
        let environmentVariables: [String: AnyObject]? = Bundle.main.infoDictionary?["EnvironmentVariables"] as? [String: AnyObject]
        let loginEmail = environmentVariables?["LOGIN_EMAIL"] as? String ?? ""
        let passwordEmail = environmentVariables?["PASSWORD_EMAIL"] as? String ?? ""
        let userEmail = environmentVariables?["USER_EMAIL"] as? String ?? ""
        let loginGitHub = environmentVariables?["LOGIN_GITHUB"] as? String ?? ""
        let passwordGitHub = environmentVariables?["PASSWORD_GITHUB"] as? String ?? ""
        let loginMicrosoft = environmentVariables?["LOGIN_MICROSOFT"] as? String ?? ""
        let passwordMicrosoft = environmentVariables?["PASSWORD_MICROSOFT"] as? String ?? ""
                
        describe("Login UI Tests") {
                
            // Instanciar app
            let app = XCUIApplication()
            app.launch()
            
            beforeEach {
                
                app.launch()
                let tabBar = app.tabBars["Tab Bar"]
                let loginButtonPage = tabBar.buttons["Login"]
                loginButtonPage.tap()
                
                let okButton = app.alerts["Sucesso!"].scrollViews.otherElements.buttons["OK"]
                if okButton.exists {
                    okButton.tap()
                    app.buttons["Logout"].tap()
                }
            }
            
            context("Verify Title") {
                
                it("Login Page Title") {
                    let titleLogin = app.staticTexts["Login Page"]
                    expect(titleLogin).toNot(beNil())
                }
            }
            
            context("Register") {
                
                it("Success Register") {
                    let emailField = app.textFields["EmailField"]
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText(loginEmail)
                    
                    let passwordField = app.secureTextFields["PasswordField"]
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText(passwordEmail)
                    
                    let signUpButton = app.buttons["Register"]
                    XCTAssertTrue(signUpButton.exists)
                    signUpButton.tap()
                }
                
                it("Faill Register") {}
            }
            
            context("Register and Sign In") {
                
                it("Success Login") {
                    let emailField = app.textFields["EmailField"]
                    XCTAssertTrue(emailField.exists)
                    emailField.tap()
                    emailField.typeText(loginEmail)
                    
                    let passwordField = app.secureTextFields["PasswordField"]
                    XCTAssertTrue(passwordField.exists)
                    passwordField.tap()
                    passwordField.typeText(passwordEmail)
                    
                    let signUpButton = app.buttons["Register"]
                    XCTAssertTrue(signUpButton.exists)
                    signUpButton.tap()
                    
                    let loginButton = app.buttons["Sign In"]
                    XCTAssertTrue(loginButton.exists)
                    loginButton.tap()
                    
                    let okButton = app.alerts["Sucesso!"].scrollViews.otherElements.buttons["OK"]
                    okButton.tap()
                    
                    let loginLabel = app.staticTexts["You are logged in, \(userEmail)"]
                    XCTAssertTrue(loginLabel.exists)
                    
                    let logoutButton = app.buttons["Logout"]
                    expect(logoutButton).toNot(beNil())
                    logoutButton.tap()
                }
                
                it("Fail Register and Sign In") {}
            }
            
            context("Sign In With Google") {
                
                it("Login") {
                    
                    let loginGoogleButton = app/*@START_MENU_TOKEN@*/.buttons["GIDSignInButton"]/*[[".buttons[\"Sign in with Google\"]",".buttons[\"GIDSignInButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                    XCTAssertTrue(loginGoogleButton.exists)
                    loginGoogleButton.tap()
                }
            }
            
            context("Sign In With Apple") {
                
                it("Login") {
                    
                    let loginGoogleButton = app.buttons["Sign in with Apple"]
                    XCTAssertTrue(loginGoogleButton.exists)
                    loginGoogleButton.tap()
                }
            }
            
            context("Sign In With GitHub") {
                
                it("Login") {
                  
                    let loginGitHubButton = app.buttons["Sign in with GitHub"]
                    XCTAssertTrue(loginGitHubButton.exists)
                    loginGitHubButton.tap()
                    
                    let emailField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .textField).element
                    XCTAssertTrue(emailField.waitForExistence(timeout: 20))
                    emailField.tap()
                    emailField.typeText(loginGitHub)
                    
                    let exitField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["Project API"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=145\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"]",".otherElements[\"main\"].staticTexts[\"Project API\"]",".staticTexts[\"Project API\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
                    if exitField.exists {
                        exitField.tap()
                    }
                    
                    let passwordField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .secureTextField).element
                    XCTAssertTrue(passwordField.waitForExistence(timeout: 20))
                    passwordField.tap()
                    passwordField.typeText(passwordGitHub)
                    
                    let signInButton = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Sign in"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"]",".otherElements[\"main\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
                    XCTAssertTrue(signInButton.exists)
                    signInButton.tap()
            
                    let logoutButton = app.buttons["Logout"]
                    expect(logoutButton).toNot(beNil())
                    logoutButton.tap()

                }
            }
            
            context("Sign In With Microsoft") {
                
                it("Login") {
                
                    let loginGitHubButton = app.buttons["Sign in with Microsoft"]
                    XCTAssertTrue(loginGitHubButton.exists)
                    loginGitHubButton.tap()
                    
                    let emailField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.textFields["Email address, phone number or Skype"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=5533\"].webViews.webViews.webViews",".otherElements[\"Sign in to your account\"]",".otherElements[\"main\"].textFields[\"Email address, phone number or Skype\"]",".textFields[\"Email address, phone number or Skype\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
                    XCTAssertTrue(emailField.waitForExistence(timeout: 20))
                    emailField.tap()
                    emailField.typeText(loginMicrosoft)
                    
                    app.webViews.webViews.webViews.buttons["Next"].tap()
                    
                    let passwordField = app.webViews.webViews.webViews.secureTextFields["Password"]
                    passwordField.tap()
                    passwordField.typeText(passwordMicrosoft)
                    
                    app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Sign in"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=5541\"].webViews.webViews.webViews",".otherElements[\"Sign in to your Microsoft account\"]",".otherElements[\"main\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
                    
                    let logoutButton = app.buttons["Logout"]
                    if logoutButton.exists {
                        expect(logoutButton).toNot(beNil())
                        logoutButton.tap()
                    }
                    
                }
            }
            
        }
    }
}
