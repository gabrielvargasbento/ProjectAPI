//
//  URLExtensionsTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 19/01/24.
//

import Quick
import Nimble
import Foundation
@testable import ProjectAPI

final class URLExtensionsTests: QuickSpec {
    
    override class func spec() {
        describe("URL Extension Tests") {
            
            context("URL.queryParamaters Test") {
                
                it("Test With Params") {
                    let url = URL(string: "https://www.example.com/?param1=value+1&param2=value+2")!
                    let urlParamaters = url.queryParamaters
                    let urlParamsExpect = ["param1": "value 1", "param2": "value 2"]
                    expect(urlParamaters).to(equal(urlParamsExpect))
                }
                
                it("Test Without Params") {
                    let url = URL(string: "https://www.example.com")!
                    let urlParamaters = url.queryParamaters
                    expect(urlParamaters).to(beNil())
                }
            }

        }
    }
}
