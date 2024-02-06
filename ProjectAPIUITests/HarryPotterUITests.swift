//
//  HarryPotterUITests.swift
//  ProjectAPIUITests
//
//  Created by Gabriel Vargas on 01/02/24.
//

import Quick
import Nimble
import XCTest

@testable import ProjectAPI

class HarryPotterUITests: QuickSpec {
    
    override class func spec() {
        describe("HarryPotter UI Tests") {
            
            // Instanciar app
            let app = XCUIApplication()
            app.launch()
            
            beforeEach {
                
                app.launch()
                let tabBar = app.tabBars["Tab Bar"]
                let loginButtonPage = tabBar.buttons["Harry Potter"]
                loginButtonPage.tap()
                
            }
            
            context("Verify Title") {
                
                it("Harry Potter Page Title") {
                    let titleGitHub = app.staticTexts["Harry Potter"]
                    expect(titleGitHub).toNot(beNil())
                }
            }
            
            context("Verify SubTitle") {
                
                it("GitHub Page SubTitle") {
                    let subTitleGitHub = app.staticTexts["PERSONAGENS"]
                    expect(subTitleGitHub).toNot(beNil())
                }
            }
            
            context("Verify API List") {
                
                it("Test API List - Character View") {
                    let firstItem = app.staticTexts["Harry Potter"]
                    expect(firstItem).toNot(beNil())
                    firstItem.tap()
                    
                    let imageAvatar = app.images["characterImage"]
                    expect(imageAvatar).toNot(beNil())
                    
                    let name = app.staticTexts["Harry Potter"]
                    expect(name).toNot(beNil())
                    
                    let house = app.staticTexts["Gryffindor"]
                    expect(house).toNot(beNil())
                    
                    let dateOfBirth = app.staticTexts["31-07-1980"]
                    expect(dateOfBirth).toNot(beNil())
                    
                    let actorName = app.staticTexts["Daniel Radcliffe"]
                    expect(actorName).toNot(beNil())
                    
                    let crashButton = app.buttons["Crash"]
                    expect(crashButton).toNot(beNil())
                    //crashButton.tap()
                }
                
            }
            
        }
    }
}
