//
//  RepositoriesViewModelTests.swift
//  ProjectAPITests
//
//  Created by Gaberiel Vargas on 19/01/24.
//

import Quick
import Nimble
@testable import ProjectAPI

final class RepositoriesViewModelTests: QuickSpec {
    
    override class func spec() {
        describe("Repository View Model Tests") {
            
            var sut: APIService<MockModel>!

            beforeEach {
                sut = APIService<MockModel>()
            }
            
            context("Fetch Repositories") {
                it("Invalid URL") {
                    let invalidURL = ""
                }
            }
            
            afterEach {
                sut = nil
            }
        }
    }
}
