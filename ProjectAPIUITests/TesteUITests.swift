////
////  TesteUITests.swift
////  ProjectAPIUITests
////
////  Created by dti Digital on 02/02/24.
////
//
//import XCTest
//
//final class TesteUITests: XCTestCase {
//
//    override func setUpWithError() throws {
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        
//        
//        let app = app2
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["Notification"].tap()
//        
//        let loginButton = tabBar.buttons["Login"]
//        loginButton.tap()
//        loginButton.tap()
//        loginButton.tap()
//        loginButton.tap()
//        app.buttons["Sign in with GitHub"].tap()
//        
//        let textField = app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .textField).element
//        textField.tap()
//        textField.tap()
//        textField.tap()
//        
//        let app2 = app
//        app2/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.otherElements["main"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"].otherElements[\"main\"]",".otherElements[\"main\"]",".webViews.webViews.webViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.children(matching: .secureTextField).element.tap()
//        app2/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Sign in"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=96750\"].webViews.webViews.webViews",".otherElements[\"Sign in to GitHub · GitHub\"]",".otherElements[\"main\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app2/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"Would you like to save this password to use with apps and websites?\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons["Not Now"].tap()
//        app.alerts["Sucesso!"].scrollViews.otherElements.buttons["OK"].tap()
//        app.buttons["Logout"].tap()
//        
//        let gidsigninbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["GIDSignInButton"]/*[[".buttons[\"Sign in with Google\"]",".buttons[\"GIDSignInButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        gidsigninbuttonButton.tap()
//        gidsigninbuttonButton.tap()
//        
//        let signInWithMicrosoftButton = app.buttons["Sign in with Microsoft"]
//        signInWithMicrosoftButton.tap()
//        signInWithMicrosoftButton.tap()
//                        
//        
//
//    }
//
//
//}
