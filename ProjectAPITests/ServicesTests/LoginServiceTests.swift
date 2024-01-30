//
//  LoginServiceTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 25/01/24.
//

import Cuckoo
import Quick
import Nimble
import Foundation

@testable import ProjectAPI

class LoginServiceTests: QuickSpec {
    
    override class func spec() {
        
        describe("Login Service Tests") {
            
            var sut: LoginService!
            var mockAuthService: MockFirebaseAuthService!
            
            beforeEach {
                mockAuthService = MockFirebaseAuthService().withEnabledSuperclassSpy()
                sut = LoginService(firebaseAuth: mockAuthService)
            }
            
            afterEach {
                mockAuthService = nil
                sut = nil
            }
            
            context("Logout") {
                
                it("Success Logout") {

                    stub(mockAuthService) { mock in
                        when(mock.signOut()).thenDoNothing()
                    }
                    
                    expect { sut.logout() }.toNot(throwError())
                }
                
                it("Fail Logout") {

                    let error = NSError(domain: "test", code: 404, userInfo: nil)
                    stub(mockAuthService) { mock in
                        when(mock.signOut()).thenThrow(error)
                    }
                    
                    expect { sut.logout() }.toNot(throwError())
                }
            }
            
            context("Login") {
                
                it("Success Login") {
                    let email = "test@example.com"
                    let password = "password"

//                    stub(mockAuthService) { mock in
//                        when(mock.signIn(withEmail: email, password: password, completion: (nil, nil)).then { _, completion in
//                            completion(nil, nil)
//                        }
//                    }
//                    
//                    stub(mockAuthService) { mock in
//                        when(mock.signIn(withEmail: email, password: password)).thenReturn(nil, nil)
//                    }

                    var loginError: Error?
                    sut.login(email: email, password: password) { error in
                        loginError = error
                    }

                    expect(loginError).to(beNil())
                }

                it("Fail Login") {
                    let email = "test@example.com"
                    let password = "password123"
                    let error = NSError(domain: "test", code: 404, userInfo: nil)

                    stub(mockAuthService) { mock in
                           when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, completion in
                               completion(nil, error)
                           }
                       }

                       var loginError: Error?
                       sut.login(email: email, password: password) { error in
                           loginError = error
                       }

                       expect(loginError).to(equal(error))
                }
            }

        }
    }
}
