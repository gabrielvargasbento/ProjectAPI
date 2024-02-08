////
////  LoginServiceTests.swift
////  ProjectAPITests
////
////  Created by Gabriel Vargas on 25/01/24.
////
//
//import Cuckoo
//import Quick
//import Nimble
//import Foundation
//import FirebaseAuth
//
//@testable import ProjectAPI
//
//class LoginServiceTests: QuickSpec {
//    
//    override class func spec() {
//        
//        var environmentVariables: [String: AnyObject]? = Bundle.main.infoDictionary?["EnvironmentVariables"] as? [String: AnyObject]
//        let myEmail: String? = environmentVariables?["LOGIN_EMAIL"] as? String
//        
//        // Verificar se myEmail não é nulo antes de usá-lo
//        if let email = myEmail {
//            print("my email: \(email)")
//        } else {
//            print("Email não encontrado.")
//        }
//
//        
//        describe("Login Service Tests") {
//            
//            print("print(ProcessInfo.processInfo.environment):\n\n\n\n\n")
//
//            
//            for (key, value) in ProcessInfo.processInfo.environment {
//                let padding = max(0, 30 - key.count) // Verifica se a subtração resulta em um número negativo
//                let paddingString = String(repeating: " ", count: padding)
//                print("\(key):\(paddingString) \(value)")
//            }
//
//
//            
//            if let loginEmail = Bundle.main.infoDictionary?["LOGIN_EMAIL"] as? String {
//                print("O valor da variável de ambiente LOGIN_EMAIL é: \(loginEmail)")
//            } else {
//                print("A variável de ambiente LOGIN_EMAIL não está definida.")
//            }
//            
//            if let loginEmail = ProcessInfo.processInfo.environment["LOGIN_EMAIL"] {
//                print("O valor da variável de ambiente LOGIN_EMAIL é: \(loginEmail)")
//            } else {
//                print("A variável de ambiente LOGIN_EMAIL não está definida.")
//            }
//
//
//            
//            // Caminho para o arquivo .plist
//            guard let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
//                let configDictionary = NSDictionary(contentsOfFile: plistPath) else {
//                    fatalError("Info.plist não encontrado.")
//            }
//
//            if let myValue = ProcessInfo.processInfo.environment["MY_VARIABLE"] {
//                print("My value is: \(myValue)")
//            } else {
//                print("MY_VARIABLE não está definida")
//            }
//
//            var loginEmail = ""
//            
//            if let loginEmail = ProcessInfo.processInfo.environment["LOGIN_EMAIL"] {
//                print("login Email is: \(loginEmail)")
//            } else {
//                print("LOGIN_EMAIL não está definida")
//            }
//
//            if let anotherValue = ProcessInfo.processInfo.environment["ANOTHER_VARIABLE"] {
//                print("Another value is: \(anotherValue)")
//            } else {
//                print("ANOTHER_VARIABLE não está definida")
//                
//            }
//            
//
//            
////            let emailll = Bundle.main.object(forInfoDictionaryKey: "LOGIN_EMAIL") as! String
////            print(emailll)
//
//            
//            let infoDictionary: [String: Any] = Bundle.main.infoDictionary!
//            let passwordEmail = infoDictionary["LOGIN_EMAIL"] as! String
//            let userEmail = infoDictionary["USER_EMAIL"] as! String
//            let loginGitHub = infoDictionary["LOGIN_GITHUB"] as! String
//            let passwordGitHub = infoDictionary["PASSWORD_GITHUB"] as! String
//            let loginMicrosoft = infoDictionary["LOGIN_MICROSOFT"] as! String
//            let passwordMicrosoft = infoDictionary["PASSWORD_MICROSOFT"] as! String
//            
//            var sut: LoginService!
//            var mockAuthService: MockFirebaseAuthService!
//            var mockOAuthProvider: MockFirebaseOAuthProvider!
//            
//            beforeEach {
//                mockAuthService = MockFirebaseAuthService().withEnabledSuperclassSpy()
//                mockOAuthProvider = MockFirebaseOAuthProvider(providerID: "").withEnabledSuperclassSpy()
//                
//                sut = LoginService(firebaseAuth: mockAuthService, gitHubProvider: mockOAuthProvider)
//            }
//            
//            afterEach {
//                sut = nil
//                mockAuthService = nil
//                mockOAuthProvider = nil
//            }
//            
//            context("Logout") {
//                
//                it("Success Logout") {
//
//                    stub(mockAuthService) { mock in
//                        when(mock.signOut()).thenDoNothing()
//                    }
//                    
//                    expect { sut.logout() }.toNot(throwError())
//                }
//                
//                it("Fail Logout") {
//
//                    let error = NSError(domain: "test", code: 404, userInfo: nil)
//                    stub(mockAuthService) { mock in
//                        when(mock.signOut()).thenThrow(error)
//                    }
//                    
//                    expect { sut.logout() }.toNot(throwError())
//                }
//            }
//            
//            context("Login") {
//                
//                it("Login Error") {
//                    let email = "test@example.com"
//                    let password = "password"
//
//                    stub(mockAuthService) { mock in
//                        when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
//                            let authDataResult: AuthDataResult? = nil
//                            let error = NSError(domain: "LoginService: login", code: 404, userInfo: nil)
//                            completion(authDataResult, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: AuthDataResult?
//                    
//                    sut.login(email: email, password: password) { result, error in
//                        loginError = error
//                        loginResult = result
//                    }
//
//                    expect(loginError).toNot(beNil())
//                    expect(loginResult).to(beNil())
//                }
//                
//                it("Login Success") {
//                    
//                    
//                    let email = "test@example.com"
//                    let password = "password"
//
//                    stub(mockAuthService) { mock in
//                        when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
//
//                            let authDataResult: AuthDataResult? = nil
//                            let error: Error? = nil
//                            
//                            completion(authDataResult, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: AuthDataResult?
//                    sut.login(email: email, password: password) { (result, error) in
//                        loginError = error
//                        loginResult = result
//                        
//                    }
//
//                    expect(loginError).to(beNil())
//                    expect(loginResult).toNot(beNil())
//                }
//                
//                it("Login Null") {
//                    
//                    
//                    let email = "test@example.com"
//                    let password = "password"
//
//                    stub(mockAuthService) { mock in
//                        when(mock.signIn(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
//
//                            let authDataResult: AuthDataResult? = nil
//                            let error: Error? = nil
//                            
//                            completion(authDataResult, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: AuthDataResult?
//                    sut.login(email: email, password: password) { (result, error) in
//                        loginError = error
//                        loginResult = result
//                        
//                    }
//
//                    expect(loginError).to(beNil())
//                    expect(loginResult).to(beNil())
//                }
//            }
//            
//            context("Register") {
// 
//                
//                it("Register Error") {
//                    let email = "test@example.com"
//                    let password = "password"
//                    
//                    stub(mockAuthService) { mock in
//                        when(mock.createUser(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
//                            let authDataResult: AuthDataResult? = nil
//                            let error = NSError(domain: "LoginService: login", code: 404, userInfo: nil)
//                            completion(authDataResult, error)
//                        }
//                    }
//                    
//                    var loginError: Error?
//                    var loginResult: AuthDataResult?
//                    
//                    sut.register(email: email, password: password) { result, error in
//                        loginError = error
//                        loginResult = result
//                    }
//                    
//                    expect(loginError).toNot(beNil())
//                    expect(loginResult).to(beNil())
//                }
//                
//                it("Register Success") {
//                    
//                    
//                    let email = "test@example.com"
//                    let password = "password"
//
//                    stub(mockAuthService) { mock in
//                        when(mock.createUser(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
//
//                            let authDataResult: AuthDataResult? = nil
//                            let error: Error? = nil
//                            
//                            completion(authDataResult, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: AuthDataResult?
//                    sut.register(email: email, password: password) { (result, error) in
//                        loginError = error
//                        loginResult = result
//                        
//                    }
//
//                    expect(loginError).to(beNil())
//                    expect(loginResult).toNot(beNil())
//                }
//                
//                it("Register Null") {
//                    
//                    
//                    let email = "test@example.com"
//                    let password = "password"
//
//                    stub(mockAuthService) { mock in
//                        when(mock.createUser(withEmail: email, password: password, completion: anyClosure())).then { _, _, completion in
//
//                            let authDataResult: AuthDataResult? = nil
//                            let error: Error? = nil
//                            
//                            completion(authDataResult, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: AuthDataResult?
//                    sut.register(email: email, password: password) { (result, error) in
//                        loginError = error
//                        loginResult = result
//                        
//                    }
//
//                    expect(loginError).to(beNil())
//                    expect(loginResult).to(beNil())
//                }
//                
//            }
//            
//            context("Login With GitHub") {
// 
//                
//                it("Login Error") {
//                    
//                    stub(mockOAuthProvider) { mock in
//                        when(mock.getCredentialWith(completion: anyClosure())).then { completion in
//                            let authCredential: AuthCredential? = nil
//                            let error = NSError(domain: "LoginService: login GitHub", code: 404, userInfo: nil)
//                            completion(authCredential, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: String?
//                    
//                    sut.loginWithGitHub() { result, error in
//                        loginError = error
//                        loginResult = result
//                    }
//
//                    expect(loginError).toNot(beNil())
//                    expect(loginResult).to(beNil())
//                }
//                
//                it("Login Error Without AuthDataResult") {
//                    
//                    stub(mockOAuthProvider) { mock in
//                        when(mock.getCredentialWith(completion: anyClosure())).then { completion in
//                            let authCredential: AuthCredential? = nil
//                            let error: Error? = nil
//                            completion(authCredential, error)
//                        }
//                    }
//
//                    var loginError: Error?
//                    var loginResult: String?
//                    
//                    sut.loginWithGitHub() { result, error in
//                        loginError = error
//                        loginResult = result
//                    }
//
//                    expect(loginError).toNot(beNil())
//                    expect(loginResult).to(beNil())
//                }
//                
//                it("Login Error With AuthDataResult.credential") {
//                    
//                    
//                    let mockEmail = "test@email.com"
//                    let mockPassword = "password123"
//                    
//                    let authCredential = EmailAuthProvider.credential(withEmail: mockEmail, password: mockPassword)
//                    let error: Error? = nil
//                    
//                    stub(mockOAuthProvider) { mock in
//                        when(mock.getCredentialWith(completion: anyClosure())).then { completion in
//                            completion(authCredential, error)
//                        }
//                    }
//                    
//                    stub(mockAuthService) { mock in
//                        when(mock.signIn(with: authCredential, completion: anyClosure())).then { completion in
//
//                            let authDataResult: AuthCredential? = nil
//                            let error = NSError(domain: "LoginService: login GitHub", code: 404, userInfo: nil)
//                            
//                            completion(authDataResult, error)
//                        }
//                    }
//                    
//                    var loginError: Error?
//                    var loginResult: String?
//                    
//                    sut.loginWithGitHub() { result, error in
//                        loginError = error
//                        loginResult = result
//                    }
//                    
//                    expect(loginError).to(beNil())
//                    expect(loginResult).toNot(beNil())
//                }
//                
//            }
//
//        }
//    }
//}
