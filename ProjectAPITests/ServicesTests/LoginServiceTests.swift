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
import FirebaseAuth

@testable import ProjectAPI

class LoginServiceTests: QuickSpec {
    
    override class func spec() {
        
        describe("Login Service Tests") {
            
            var sut: LoginService!
            var mockAuthService: MockFirebaseAuthService!
            var mockOAuthProvider: MockFirebaseOAuthProvider!
            
            beforeEach {
                mockAuthService = MockFirebaseAuthService().withEnabledSuperclassSpy()
                mockOAuthProvider = MockFirebaseOAuthProvider(providerID: "").withEnabledSuperclassSpy()
                
                sut = LoginService(firebaseAuth: mockAuthService, gitHubProvider: mockOAuthProvider)
            }
            
            afterEach {
                sut = nil
                mockAuthService = nil
                mockOAuthProvider = nil
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
                
                it("Login Error") {
                    let email = "test@example.com"
                    let password = "password"
                    
                    stub(mockAuthService) { mock in
                        when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
                            let authDataResult: AuthDataResult? = nil
                            let error = NSError(domain: "LoginService: login", code: 404, userInfo: nil)
                            completion(authDataResult, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: AuthDataResult?
                    
                    sut.login(email: email, password: password) { result, error in
                        loginError = error
                        loginResult = result
                    }
                    
                    expect(loginError).toNot(beNil())
                    expect(loginResult).to(beNil())
                }
                
                it("Login Success") {
                    
                    
                    let email = "test@example.com"
                    let password = "password"
                    
                    stub(mockAuthService) { mock in
                        when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
                            
                            let authDataResult: AuthDataResult? = nil
                            let error: Error? = nil
                            
                            completion(authDataResult, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: AuthDataResult?
                    sut.login(email: email, password: password) { (result, error) in
                        loginError = error
                        loginResult = result
                        
                    }
                    
                    expect(loginError).to(beNil())
                    expect(loginResult).toNot(beNil())
                }
                
                it("Login Null") {
                    
                    
                    let email = "test@example.com"
                    let password = "password"
                    
                    stub(mockAuthService) { mock in
                        when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
                            
                            let authDataResult: AuthDataResult? = nil
                            let error: Error? = nil
                            
                            completion(authDataResult, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: AuthDataResult?
                    sut.login(email: email, password: password) { (result, error) in
                        loginError = error
                        loginResult = result
                        
                    }
                    
                    expect(loginError).to(beNil())
                    expect(loginResult).to(beNil())
                }
            }
            
            context("Register") {
                
                
                it("Register Error") {
                    let email = "test@example.com"
                    let password = "password"
                    
                    stub(mockAuthService) { mock in
                        when(mock.createUser(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
                            let authDataResult: AuthDataResult? = nil
                            let error = NSError(domain: "LoginService: login", code: 404, userInfo: nil)
                            completion(authDataResult, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: AuthDataResult?
                    
                    sut.register(email: email, password: password) { result, error in
                        loginError = error
                        loginResult = result
                    }
                    
                    expect(loginError).toNot(beNil())
                    expect(loginResult).to(beNil())
                }
                
                it("Register Success") {
                    
                    
                    let email = "test@example.com"
                    let password = "password"
                    
                    stub(mockAuthService) { mock in
                        when(mock.createUser(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
                            
                            let authDataResult: AuthDataResult? = nil
                            let error: Error? = nil
                            
                            completion(authDataResult, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: AuthDataResult?
                    sut.register(email: email, password: password) { (result, error) in
                        loginError = error
                        loginResult = result
                        
                    }
                    
                    expect(loginError).to(beNil())
                    expect(loginResult).toNot(beNil())
                }
                
                it("Register Null") {
                    
                    
                    let email = "test@example.com"
                    let password = "password"
                    
                    stub(mockAuthService) { mock in
                        when(mock.createUser(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
                            
                            let authDataResult: AuthDataResult? = nil
                            let error: Error? = nil
                            
                            completion(authDataResult, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: AuthDataResult?
                    sut.register(email: email, password: password) { (result, error) in
                        loginError = error
                        loginResult = result
                        
                    }
                    
                    expect(loginError).to(beNil())
                    expect(loginResult).to(beNil())
                }
                
            }
            
            context("Login With GitHub") {
                
                
                it("Login Error") {
                    
                    stub(mockOAuthProvider) { mock in
                        when(mock.getCredentialWith(completion: anyClosure())).then { completion in
                            let authCredential: AuthCredential? = nil
                            let error = NSError(domain: "LoginService: login GitHub", code: 404, userInfo: nil)
                            completion(authCredential, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: String?
                    
                    sut.loginWithGitHub() { result, error in
                        loginError = error
                        loginResult = result
                    }
                    
                    expect(loginError).toNot(beNil())
                    expect(loginResult).to(beNil())
                }
                
                it("Login Error Without AuthDataResult") {
                    
                    stub(mockOAuthProvider) { mock in
                        when(mock.getCredentialWith(completion: anyClosure())).then { completion in
                            let authCredential: AuthCredential? = nil
                            let error: Error? = nil
                            completion(authCredential, error)
                        }
                    }
                    
                    var loginError: Error?
                    var loginResult: String?
                    
                    sut.loginWithGitHub() { result, error in
                        loginError = error
                        loginResult = result
                    }
                    
                    expect(loginError).toNot(beNil())
                    expect(loginResult).to(beNil())
                }
                
                it("Login Error With AuthDataResult.credential") {
                    
                    
                    let mockEmail = "test@email.com"
                    let mockPassword = "password123"
                    
                    let authCredential = EmailAuthProvider.credential(withEmail: mockEmail, password: mockPassword)
                    let error: Error? = nil
                    
                    stub(mockOAuthProvider) { mock in
                        when(mock.getCredentialWith(completion: anyClosure())).then { completion in
                            completion(authCredential, error)
                        }
                    }
                    
                    //                    stub(mockAuthService) { mock in
                    //                        when(mock.signIn(with: authCredential, completion: anyClosure())).then { completion in
                    //
                    //                            let authDataResult: AuthCredential? = nil
                    //                            let error = NSError(domain: "LoginService: login GitHub", code: 404, userInfo: nil)
                    //
                    //                            completion(authDataResult, error)
                    //                        }
                }
                
                var loginError: Error?
                var loginResult: String?
                
                sut.loginWithGitHub() { result, error in
                    loginError = error
                    loginResult = result
                }
                
                expect(loginError).to(beNil())
                expect(loginResult).toNot(beNil())
            }
        }
    }
}
