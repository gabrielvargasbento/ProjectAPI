//
//  RepositoryTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 15/01/24.
//

import Quick
import Nimble
@testable import ProjectAPI

final class RepositoryTests: QuickSpec {
    
    override class func spec() {
        describe("Repository Model Tests") {
            
            var owner: Owner?
            var repository: Repository?
            
            context("Is A Valid Repository") {
                
                beforeEach {
                    owner = Owner(
                        login: "mojombo",
                        id: 1,
                        avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
                        htmlUrl: "https://github.com/mojombo")
                    
                    repository = Repository(
                        id: 1,
                        name: "grit",
                        fullName: "mojombo/grit",
                        owner: owner,
                        description: "**Grit is no longer maintained...")
                }
                
                it("Get Repository Atributes") {
                    expect(repository?.id).to(equal(1))
                    expect(repository?.name).to(equal("grit"))
                    expect(repository?.fullName).to(equal("mojombo/grit"))
                    expect(repository?.owner?.login).to(equal("mojombo"))
                    expect(repository?.owner?.id).to(equal(1))
                    expect(repository?.owner?.avatarUrl).to(equal("https://avatars.githubusercontent.com/u/1?v=4"))
                    expect(repository?.owner?.htmlUrl).to(equal("https://github.com/mojombo"))
                    expect(repository?.description).to(equal("**Grit is no longer maintained..."))
                }
                
                it("Codable Repository") {
                    expect(repository).to(beAKindOf((any Codable).self))
                }
                
                it("Hashable Repository") {
                    expect(repository).to(beAKindOf((any Hashable).self))
                }
                
                it("Identifiable Repository") {
                    expect(repository).to(beAKindOf((any Identifiable).self))
                }
                
                it("RepositoryItem Repository") {
                    expect(repository).to(beAKindOf((any RepositoryItem).self))
                }
                
                afterEach {
                    owner = nil
                    repository = nil
                }
            }
            
            context("Is A Valid Repository with null value") {
                
                beforeEach {
                    repository = Repository(
                        id: 1,
                        name: nil,
                        fullName: nil,
                        owner: nil,
                        description: nil)
                }
                
                it("Get Repository Atributes") {
                    expect(repository?.id).to(equal(1))
                    expect(repository?.name).to(beNil())
                    expect(repository?.fullName).to(beNil())
                    expect(repository?.owner?.login).to(beNil())
                    expect(repository?.owner?.id).to(beNil())
                    expect(repository?.owner?.avatarUrl).to(beNil())
                    expect(repository?.owner?.htmlUrl).to(beNil())
                    expect(repository?.description).to(beNil())
                }
                
                it("Codable Repository") {
                    expect(repository).to(beAKindOf((any Codable).self))
                }
                
                it("Hashable Repository") {
                    expect(repository).to(beAKindOf((any Hashable).self))
                }
                
                it("Identifiable Repository") {
                    expect(repository).to(beAKindOf((any Identifiable).self))
                }
                
                it("RepositoryItem Repository") {
                    expect(repository).to(beAKindOf((any RepositoryItem).self))
                }
                
                afterEach {
                    owner = nil
                    repository = nil
                }
            }
            
            context("Is A Invalid Repository") {
                
                beforeEach {
                    owner = nil
                    repository = nil
                }
                
                it("Get Repository Atributes") {
                    expect(repository?.id).to(beNil())
                    expect(repository?.name).to(beNil())
                    expect(repository?.fullName).to(beNil())
                    expect(repository?.owner?.login).to(beNil())
                    expect(repository?.owner?.id).to(beNil())
                    expect(repository?.owner?.avatarUrl).to(beNil())
                    expect(repository?.owner?.htmlUrl).to(beNil())
                    expect(repository?.description).to(beNil())
                }
                
                it("Codable Repository") {
                    expect(repository as? (any Codable)).to(beNil())
                }

                it("Hashable Repository") {
                    expect(repository as? (any Hashable)).to(beNil())
                }

                it("Identifiable Repository") {
                    expect(repository as? (any Identifiable)).to(beNil())
                }

                it("RepositoryItem Repository") {
                    expect(repository as? RepositoryItem).to(beNil())
                }
                
                afterEach {
                    owner = nil
                    repository = nil
                }
            }
        }
    }
}
