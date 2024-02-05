//
//  GitHubUITests.swift
//  ProjectAPIUITests
//
//  Created by Gabriel Vargas on 01/02/24.
//

import Quick
import Nimble
import XCTest

class GitHubUITests: QuickSpec {
    
    override class func spec() {
        describe("GitHub UI Tests") {
            
            // Instanciar app
            let app = XCUIApplication()
            app.launch()
            
            beforeEach {
                
                app.launch()
                let tabBar = app.tabBars["Tab Bar"]
                let loginButtonPage = tabBar.buttons["GitHub"]
                loginButtonPage.tap()
                
            }
            
            context("Verify Title") {
                
                it("GitHub Page Title") {
                    let titleGitHub = app.staticTexts["GitHub"]
                    expect(titleGitHub).toNot(beNil())
                }
            }
            
            context("Verify SubTitle") {
                
                it("GitHub Page SubTitle") {
                    let subTitleGitHub = app.staticTexts["REPOSITÓRIOS"]
                    expect(subTitleGitHub).toNot(beNil())
                }
            }
            
            context("Verify API List") {
                
                it("Test API List - Account View") {
                    let firstItem = app.staticTexts["1 - grit"]
                    expect(firstItem).toNot(beNil())
                    firstItem.tap()
                    
                    let imageAvatar = app.images["avatarUrlImage"]
                    expect(imageAvatar).toNot(beNil())
                    
                    let name = app.staticTexts["grit"]
                    expect(name).toNot(beNil())
                    
                    let login = app.staticTexts["mojombo"]
                    expect(login).toNot(beNil())
                    
                    let description = app.staticTexts["**Grit is no longer maintained"]
                    expect(description).toNot(beNil())
                    
                    let accessGitHubButton = app.buttons["Access GitHub"]
                    expect(accessGitHubButton).toNot(beNil())
                    accessGitHubButton.tap()
                }
                
            }
            
        }
    }
}
