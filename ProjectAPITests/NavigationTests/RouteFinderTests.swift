//
//  RouteFinderTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 23/01/24.
//

import Quick
import Nimble
import Foundation
import SwiftUI
@testable import ProjectAPI

class RouteFinderTests: QuickSpec {
    
    override class func spec() {
        describe("Route Finder Tests") {
            
            var sut: RouteFinder!
            
            beforeEach {
                sut = nil
            }
            
            afterEach {
                sut = nil
            }
            
            context("Test Func Find") {
                
                it("URL With Invalid URL Host") {
                    
                    let mockURLString = "mock"
                    let mockData = """
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
                    let repository = RepositoriesViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia da rota
                            expect(route).to(beNil())
                            
                            done()
                        }
                    }
                }                
                
                it("DeepLink case .repositoryMenu") {
                    
                    let mockURLString = "projectapi://repositoryMenu"
                    let mockData = """
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
                    let repository = RepositoriesViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca da rota
                            expect(route).toNot(beNil())
                            
                            if let route = route {
                                expect(route).to(equal(ProjectAPI.Route.repositoryMenu))
                            }
                            
                            done()
                        }
                    }
                }
                
                it("DeepLink case .harryPotterMenu") {
                    
                    let mockURLString = "projectapi://harryPotterMenu"
                    let mockData = """
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
                    let repository = RepositoriesViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar ausencia de erro
                            expect(error).to(beNil())
                            
                            // Verififcar presenca da rota
                            expect(route).toNot(beNil())
                            
                            if let route = route {
                                expect(route).to(equal(ProjectAPI.Route.harryPotterMenu))
                            }
                            
                            done()
                        }
                    }
                }
                
                it("DeepLink case .repository without query params") {
                    
                    let mockURLString = "projectapi://repository"
                    let mockData = """
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
                    let repository = RepositoriesViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia da rota
                            expect(route).to(beNil())
                            
                            done()
                        }
                    }
                }
                
                it("DeepLink case .repository with error") {
                    
                    let mockURLString = "projectapi://repository"
                    let mockData = """
                        [{"id": 1, "name": "item1"}, {"id": 2, "name": "item2"}]
                    """.data(using: .utf8)!
                    let mockError = NSError(domain: "Project API: RouteFinderTests", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
                    let repository = RepositoriesViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia da rota
                            expect(route).to(beNil())

                            done()
                        }
                    }
                }
                
                it("DeepLink case .repository correctly") {
                    
                    let mockURLString = "projectapi://repository?name=grit"
                    
                    let repository = Repository(
                        id: 1,
                        name: "grit",
                        fullName: nil,
                        owner: nil,
                        description: nil)
                    
                    let repositoryDict: [String: Any] = [
                        "id": repository.id,
                        "name": repository.name as Any,
                        "fullName": repository.fullName as Any,
                        "owner": repository.owner as Any,
                        "description": repository.description as Any
                    ]
                    
                    let data = try! JSONSerialization.data(withJSONObject: repositoryDict, options: .prettyPrinted)
                    
                    if let jsonString = String(data: data, encoding: .utf8) {
                        
                        let mockData = """
                            \(jsonString)
                        """.data(using: .utf8)!
                                                
                        URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)

                        let repositoryMock = RepositoriesViewModelMock(url: URL(string: mockURLString)!)
                        
                        sut = RouteFinder(repoViewModel: repositoryMock)
                        
                        waitUntil { done in
                            
                            sut.find(from: URL(string: mockURLString)!) { (route, error) in
                                
                                // Verificar ausencia de erro
                                expect(error).to(beNil())
                                
                                // Verififcar presenca da rota
                                expect(route).toNot(beNil())
                                
                                if let route = route {
                                    expect(route).to(equal(ProjectAPI.Route.repositoryItem(item: repository)))
                                }
                                
                                done()
                            }
                        }
                    }
                }
                
                it("DeepLink case .harryPotter without query params") {
                    
                    let mockURLString = "projectapi://harryPotter"
                    let mockData = """
                    """.data(using: .utf8)!
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)
                    
                    let harryPotterMock = HarryPotterViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia da rota
                            expect(route).to(beNil())
                            
                            done()
                        }
                    }
                }
                
                it("DeepLink case .harryPotter with error") {
                    
                    let mockURLString = "projectapi://harryPotter"
                    let mockData = """
                        [{"id": "1", "name": "item1"}, {"id": "2", "name": "item2"}]
                    """.data(using: .utf8)!
                    let mockError = NSError(domain: "Project API: RouteFinderTests", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
                    
                    URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: mockError)
                    let harryPotterMock = HarryPotterViewModelMock(url: URL(string: mockURLString)!)
                    
                    sut = RouteFinder()
                    
                    waitUntil { done in
                        
                        sut.find(from: URL(string: mockURLString)!) { (route, error) in
                            
                            // Verificar presenca de erro
                            expect(error).toNot(beNil())
                            
                            // Verififcar ausencia da rota
                            expect(route).to(beNil())

                            done()
                        }
                    }
                }
                
                it("DeepLink case .harryPotter correctly") {
                    
                    let mockURLString = "projectapi://harryPotter?id=9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"
                    
                    let harryPotter = HarryPotter(
                        id: "1",
                        name: "Harry Potter",
                        house: nil,
                        dateOfBirth: nil,
                        actor: nil,
                        image: nil)
                    
                    let harryPotterDict: [String: Any] = [
                        "id": harryPotter.id as Any,
                        "name": harryPotter.name as Any,
                        "house": harryPotter.house as Any,
                        "dateOfBirth": harryPotter.dateOfBirth as Any,
                        "actor": harryPotter.actor as Any,
                        "image": harryPotter.image as Any
                    ]
                    
                    let data = try! JSONSerialization.data(withJSONObject: harryPotterDict, options: .prettyPrinted)
                    
                    if let jsonString = String(data: data, encoding: .utf8) {
                        
                        let mockData = """
                            \(jsonString)
                        """.data(using: .utf8)!
                                                
                        URLProtocolMock.registerMockURL(mockURLString, with: mockData, with: nil)

                        let harryPotterMock = HarryPotterViewModelMock(url: URL(string: mockURLString)!)
                        
                        sut = RouteFinder(harryPotterViewModel: harryPotterMock)
                        
                        waitUntil { done in
                            
                            sut.find(from: URL(string: mockURLString)!) { (route, error) in
                                
                                // Verificar ausencia de erro
                                expect(error).to(beNil())
                                
                                // Verififcar presenca da rota
                                expect(route).toNot(beNil())
                                
                                if let route = route {
                                    expect(route).to(equal(ProjectAPI.Route.harryPotterItem(item: harryPotter)))
                                }
                                
                                done()
                            }
                        }
                    }
                }
                
            }
        }
    }
}

class RepositoriesViewModelMock: ObservableObject, ViewModelProtocol {
    
    typealias T = Repository
    
    @Published var apiService = APIService<Repository>()
    @Published var selectedItem: T? = nil
    
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(completion: @escaping ([T]?, Error?) -> ()) {}
    
    func fetchItem(identifier: String?, completion: @escaping (T?, Error?) -> ()) {
        
        self.apiService.fetchDataItem(from: url) { (item, error) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                completion(nil, error)
            }
            
            if let item = item {
                self.selectedItem = item
                completion(item, nil)
            }
        }
    }
}

class HarryPotterViewModelMock: ObservableObject, ViewModelProtocol {
    
    typealias T = HarryPotter
    
    @Published var apiService = APIService<HarryPotter>()
    @Published var selectedItem: T? = nil
    
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(completion: @escaping ([T]?, Error?) -> ()) {}
    
    func fetchItem(identifier: String?, completion: @escaping (T?, Error?) -> ()) {
        
        self.apiService.fetchDataItem(from: url) { (item, error) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                completion(nil, error)
            }
            
            if let item = item {
                self.selectedItem = item
                completion(item, nil)
            }
        }
    }
}
