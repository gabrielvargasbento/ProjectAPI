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
//        
//        let app = app2
//        app.tabBars["Tab Bar"].buttons["Login"].tap()
//        
//        let signInWithMicrosoftButton = app.buttons["Sign in with Microsoft"]
//        signInWithMicrosoftButton.tap()
//        signInWithMicrosoftButton.tap()
//        
//        let app2 = app
//        app2/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.textFields["Email address, phone number or Skype"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=5533\"].webViews.webViews.webViews",".otherElements[\"Sign in to your account\"]",".otherElements[\"main\"].textFields[\"Email address, phone number or Skype\"]",".textFields[\"Email address, phone number or Skype\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app2.webViews.webViews.webViews.buttons["Next"].tap()
//        app2/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Sign in"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=5541\"].webViews.webViews.webViews",".otherElements[\"Sign in to your Microsoft account\"]",".otherElements[\"main\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app2/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["Don't show this again"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=5541\"].webViews.webViews.webViews",".otherElements.matching(identifier: \"Stay signed in?\")",".otherElements[\"main\"].staticTexts[\"Don't show this again\"]",".staticTexts[\"Don't show this again\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app2/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.buttons["Stay signed in?"]/*[[".otherElements[\"BrowserView?IsPageLoaded=true&WebViewProcessID=5541\"].webViews.webViews.webViews",".otherElements.matching(identifier: \"Stay signed in?\")",".otherElements[\"main\"].buttons[\"Stay signed in?\"]",".buttons[\"Stay signed in?\"]",".webViews.webViews.webViews"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app.alerts["Sucesso!"].scrollViews.otherElements.buttons["OK"].tap()
//                
//    }
//
//
//}
