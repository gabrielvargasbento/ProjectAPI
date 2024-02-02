// MARK: - Mocks generated from file: ProjectAPI/Model/HarryPotter.swift at 2024-01-31 15:54:41 +0000

//
//  HaryPotter.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Cuckoo
@testable import ProjectAPI

import Foundation






 class MockHarryPotterItem: HarryPotterItem, Cuckoo.ProtocolMock {
    
     typealias MocksType = HarryPotterItem
    
     typealias Stubbing = __StubbingProxy_HarryPotterItem
     typealias Verification = __VerificationProxy_HarryPotterItem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HarryPotterItem?

     func enableDefaultImplementation(_ stub: HarryPotterItem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     var id: String {
        get {
            return cuckoo_manager.getter("id",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.id)
        }
        
    }
    
    
    
    
    
     var name: String? {
        get {
            return cuckoo_manager.getter("name",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.name)
        }
        
    }
    
    
    
    
    
     var house: String? {
        get {
            return cuckoo_manager.getter("house",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.house)
        }
        
    }
    
    
    
    
    
     var dateOfBirth: String? {
        get {
            return cuckoo_manager.getter("dateOfBirth",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.dateOfBirth)
        }
        
    }
    
    
    
    
    
     var actor: String? {
        get {
            return cuckoo_manager.getter("actor",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.actor)
        }
        
    }
    
    
    
    
    
     var image: String? {
        get {
            return cuckoo_manager.getter("image",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.image)
        }
        
    }
    
    

    

    

     struct __StubbingProxy_HarryPotterItem: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var id: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHarryPotterItem, String> {
            return .init(manager: cuckoo_manager, name: "id")
        }
        
        
        
        
        var name: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHarryPotterItem, String?> {
            return .init(manager: cuckoo_manager, name: "name")
        }
        
        
        
        
        var house: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHarryPotterItem, String?> {
            return .init(manager: cuckoo_manager, name: "house")
        }
        
        
        
        
        var dateOfBirth: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHarryPotterItem, String?> {
            return .init(manager: cuckoo_manager, name: "dateOfBirth")
        }
        
        
        
        
        var actor: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHarryPotterItem, String?> {
            return .init(manager: cuckoo_manager, name: "actor")
        }
        
        
        
        
        var image: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHarryPotterItem, String?> {
            return .init(manager: cuckoo_manager, name: "image")
        }
        
        
        
    }

     struct __VerificationProxy_HarryPotterItem: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var id: Cuckoo.VerifyReadOnlyProperty<String> {
            return .init(manager: cuckoo_manager, name: "id", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var name: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "name", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var house: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "house", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var dateOfBirth: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "dateOfBirth", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var actor: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "actor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var image: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "image", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
    }
}


 class HarryPotterItemStub: HarryPotterItem {
    
    
    
    
     var id: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    
    
    
    
    
     var name: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    
    
    
    
     var house: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    
    
    
    
     var dateOfBirth: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    
    
    
    
     var actor: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    
    
    
    
     var image: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    

    

    
}





// MARK: - Mocks generated from file: ProjectAPI/Model/Repository.swift at 2024-01-31 15:54:41 +0000

//
//  Repository.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Cuckoo
@testable import ProjectAPI

import Foundation






 class MockRepositoryItem: RepositoryItem, Cuckoo.ProtocolMock {
    
     typealias MocksType = RepositoryItem
    
     typealias Stubbing = __StubbingProxy_RepositoryItem
     typealias Verification = __VerificationProxy_RepositoryItem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RepositoryItem?

     func enableDefaultImplementation(_ stub: RepositoryItem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     var id: Int {
        get {
            return cuckoo_manager.getter("id",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.id)
        }
        
    }
    
    
    
    
    
     var name: String? {
        get {
            return cuckoo_manager.getter("name",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.name)
        }
        
    }
    
    
    
    
    
     var fullName: String? {
        get {
            return cuckoo_manager.getter("fullName",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.fullName)
        }
        
    }
    
    
    
    
    
     var owner: Owner? {
        get {
            return cuckoo_manager.getter("owner",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.owner)
        }
        
    }
    
    
    
    
    
     var description: String? {
        get {
            return cuckoo_manager.getter("description",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.description)
        }
        
    }
    
    

    

    

     struct __StubbingProxy_RepositoryItem: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var id: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockRepositoryItem, Int> {
            return .init(manager: cuckoo_manager, name: "id")
        }
        
        
        
        
        var name: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockRepositoryItem, String?> {
            return .init(manager: cuckoo_manager, name: "name")
        }
        
        
        
        
        var fullName: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockRepositoryItem, String?> {
            return .init(manager: cuckoo_manager, name: "fullName")
        }
        
        
        
        
        var owner: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockRepositoryItem, Owner?> {
            return .init(manager: cuckoo_manager, name: "owner")
        }
        
        
        
        
        var description: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockRepositoryItem, String?> {
            return .init(manager: cuckoo_manager, name: "description")
        }
        
        
        
    }

     struct __VerificationProxy_RepositoryItem: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var id: Cuckoo.VerifyReadOnlyProperty<Int> {
            return .init(manager: cuckoo_manager, name: "id", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var name: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "name", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var fullName: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "fullName", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var owner: Cuckoo.VerifyReadOnlyProperty<Owner?> {
            return .init(manager: cuckoo_manager, name: "owner", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var description: Cuckoo.VerifyReadOnlyProperty<String?> {
            return .init(manager: cuckoo_manager, name: "description", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
    }
}


 class RepositoryItemStub: RepositoryItem {
    
    
    
    
     var id: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
    }
    
    
    
    
    
     var name: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    
    
    
    
     var fullName: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    
    
    
    
     var owner: Owner? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Owner?).self)
        }
        
    }
    
    
    
    
    
     var description: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        
    }
    
    

    

    
}





// MARK: - Mocks generated from file: ProjectAPI/Services/FirebaseAuthService.swift at 2024-01-31 15:54:41 +0000

//
//  FirebaseAuthService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 30/01/24.
//

import Cuckoo
@testable import ProjectAPI

import FirebaseAuth

// MARK: - Mocks generated from file: ProjectAPI/Services/LoginService.swift at 2024-01-31 15:54:41 +0000

//
//  LoginService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 08/01/24.
//

import Cuckoo
@testable import ProjectAPI

import AuthenticationServices
import Combine
import Firebase
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import SafariServices
import SwiftUI
import UIKit
import WebKit






 class MockLoginService: LoginService, Cuckoo.ClassMock {
    
     typealias MocksType = LoginService
    
     typealias Stubbing = __StubbingProxy_LoginService
     typealias Verification = __VerificationProxy_LoginService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: LoginService?

     func enableDefaultImplementation(_ stub: LoginService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var firebaseAuth: FirebaseAuthProtocol {
        get {
            return cuckoo_manager.getter("firebaseAuth",
                superclassCall:
                    
                                    super.firebaseAuth
                    ,
                defaultCall:  __defaultImplStub!.firebaseAuth)
        }
        
        set {
            cuckoo_manager.setter("firebaseAuth",
                value: newValue,
                superclassCall:
                    
                    super.firebaseAuth = newValue
                    ,
                defaultCall: __defaultImplStub!.firebaseAuth = newValue)
        }
        
    }
    
    
    
    
    
     override var gitHubProvider: OAuthProviderProtocol {
        get {
            return cuckoo_manager.getter("gitHubProvider",
                superclassCall:
                    
                                    super.gitHubProvider
                    ,
                defaultCall:  __defaultImplStub!.gitHubProvider)
        }
        
        set {
            cuckoo_manager.setter("gitHubProvider",
                value: newValue,
                superclassCall:
                    
                    super.gitHubProvider = newValue
                    ,
                defaultCall: __defaultImplStub!.gitHubProvider = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func logout()  {
        
    return cuckoo_manager.call(
    """
    logout()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.logout()
                ,
            defaultCall: __defaultImplStub!.logout())
        
    }
    
    
    
    
    
     override func login(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())  {
        
    return cuckoo_manager.call(
    """
    login(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.login(email: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.login(email: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func register(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())  {
        
    return cuckoo_manager.call(
    """
    register(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.register(email: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.register(email: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func loginWithGoogle(completion: @escaping (String?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    loginWithGoogle(completion: @escaping (String?, Error?) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.loginWithGoogle(completion: completion)
                ,
            defaultCall: __defaultImplStub!.loginWithGoogle(completion: completion))
        
    }
    
    
    
    
    
     override func loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void)
    """,
            parameters: (credential, completion),
            escapingParameters: (credential, completion),
            superclassCall:
                
                super.loginWithApple(credential: credential, completion: completion)
                ,
            defaultCall: __defaultImplStub!.loginWithApple(credential: credential, completion: completion))
        
    }
    
    
    
    
    
     override func loginWithApple(completion: @escaping (String?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    loginWithApple(completion: @escaping (String?) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.loginWithApple(completion: completion)
                ,
            defaultCall: __defaultImplStub!.loginWithApple(completion: completion))
        
    }
    
    
    
    
    
     override func loginWithGitHub(completion: @escaping (String?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    loginWithGitHub(completion: @escaping (String?, Error?) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.loginWithGitHub(completion: completion)
                ,
            defaultCall: __defaultImplStub!.loginWithGitHub(completion: completion))
        
    }
    
    
    
    
    
     override func loginWithMicrosoft(completion: @escaping (String?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    loginWithMicrosoft(completion: @escaping (String?, Error?) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.loginWithMicrosoft(completion: completion)
                ,
            defaultCall: __defaultImplStub!.loginWithMicrosoft(completion: completion))
        
    }
    
    

     struct __StubbingProxy_LoginService: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var firebaseAuth: Cuckoo.ClassToBeStubbedProperty<MockLoginService, FirebaseAuthProtocol> {
            return .init(manager: cuckoo_manager, name: "firebaseAuth")
        }
        
        
        
        
        var gitHubProvider: Cuckoo.ClassToBeStubbedProperty<MockLoginService, OAuthProviderProtocol> {
            return .init(manager: cuckoo_manager, name: "gitHubProvider")
        }
        
        
        
        
        
        func logout() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    logout()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    login(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func register<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    register(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func loginWithGoogle<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<((String?, Error?) -> Void)> where M1.MatchedType == (String?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    loginWithGoogle(completion: @escaping (String?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func loginWithApple<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(credential: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(ASAuthorizationAppleIDCredential, (Result<Void, Error>) -> Void)> where M1.MatchedType == ASAuthorizationAppleIDCredential, M2.MatchedType == (Result<Void, Error>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(ASAuthorizationAppleIDCredential, (Result<Void, Error>) -> Void)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func loginWithApple<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<((String?) -> Void)> where M1.MatchedType == (String?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    loginWithApple(completion: @escaping (String?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func loginWithGitHub<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<((String?, Error?) -> Void)> where M1.MatchedType == (String?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    loginWithGitHub(completion: @escaping (String?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func loginWithMicrosoft<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<((String?, Error?) -> Void)> where M1.MatchedType == (String?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    loginWithMicrosoft(completion: @escaping (String?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_LoginService: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var firebaseAuth: Cuckoo.VerifyProperty<FirebaseAuthProtocol> {
            return .init(manager: cuckoo_manager, name: "firebaseAuth", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var gitHubProvider: Cuckoo.VerifyProperty<OAuthProviderProtocol> {
            return .init(manager: cuckoo_manager, name: "gitHubProvider", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func logout() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    logout()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> ()), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    login(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func register<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> ()), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    register(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func loginWithGoogle<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((String?, Error?) -> Void), Void> where M1.MatchedType == (String?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    loginWithGoogle(completion: @escaping (String?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func loginWithApple<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(credential: M1, completion: M2) -> Cuckoo.__DoNotUse<(ASAuthorizationAppleIDCredential, (Result<Void, Error>) -> Void), Void> where M1.MatchedType == ASAuthorizationAppleIDCredential, M2.MatchedType == (Result<Void, Error>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(ASAuthorizationAppleIDCredential, (Result<Void, Error>) -> Void)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func loginWithApple<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((String?) -> Void), Void> where M1.MatchedType == (String?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    loginWithApple(completion: @escaping (String?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func loginWithGitHub<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((String?, Error?) -> Void), Void> where M1.MatchedType == (String?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    loginWithGitHub(completion: @escaping (String?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func loginWithMicrosoft<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((String?, Error?) -> Void), Void> where M1.MatchedType == (String?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((String?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    loginWithMicrosoft(completion: @escaping (String?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class LoginServiceStub: LoginService {
    
    
    
    
     override var firebaseAuth: FirebaseAuthProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (FirebaseAuthProtocol).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var gitHubProvider: OAuthProviderProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (OAuthProviderProtocol).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func logout()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func login(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func register(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func loginWithGoogle(completion: @escaping (String?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func loginWithApple(completion: @escaping (String?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func loginWithGitHub(completion: @escaping (String?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func loginWithMicrosoft(completion: @escaping (String?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockFirebaseAuthProtocol: FirebaseAuthProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = FirebaseAuthProtocol
    
     typealias Stubbing = __StubbingProxy_FirebaseAuthProtocol
     typealias Verification = __VerificationProxy_FirebaseAuthProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FirebaseAuthProtocol?

     func enableDefaultImplementation(_ stub: FirebaseAuthProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func signOut() throws {
        
    return try cuckoo_manager.callThrows(
    """
    signOut() throws
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.signOut())
        
    }
    
    
    
    
    
     func signIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())  {
        
    return cuckoo_manager.call(
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.signIn(withEmail: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     func signIn(with credential: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())  {
        
    return cuckoo_manager.call(
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
    """,
            parameters: (credential, completion),
            escapingParameters: (credential, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.signIn(with: credential, completion: completion))
        
    }
    
    
    
    
    
     func createUser(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    createUser(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.createUser(withEmail: email, password: password, completion: completion))
        
    }
    
    

     struct __StubbingProxy_FirebaseAuthProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func signOut() -> Cuckoo.ProtocolStubNoReturnThrowingFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthProtocol.self, method:
    """
    signOut() throws
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthProtocol.self, method:
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(AuthCredential, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthProtocol.self, method:
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthProtocol.self, method:
    """
    createUser(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FirebaseAuthProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func signOut() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    signOut() throws
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> ()), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.__DoNotUse<(AuthCredential, (AuthDataResult?, Error?) -> ()), Void> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    createUser(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FirebaseAuthProtocolStub: FirebaseAuthProtocol {
    

    

    
    
    
    
     func signOut() throws  {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func signIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func signIn(with credential: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func createUser(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockFirebaseAuthService: FirebaseAuthService, Cuckoo.ClassMock {
    
     typealias MocksType = FirebaseAuthService
    
     typealias Stubbing = __StubbingProxy_FirebaseAuthService
     typealias Verification = __VerificationProxy_FirebaseAuthService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: FirebaseAuthService?

     func enableDefaultImplementation(_ stub: FirebaseAuthService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func signOut() throws {
        
    return try cuckoo_manager.callThrows(
    """
    signOut() throws
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.signOut()
                ,
            defaultCall: __defaultImplStub!.signOut())
        
    }
    
    
    
    
    
     override func signIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.signIn(withEmail: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.signIn(withEmail: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func createUser(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    createUser(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.createUser(withEmail: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.createUser(withEmail: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func signIn(with credential: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """,
            parameters: (credential, completion),
            escapingParameters: (credential, completion),
            superclassCall:
                
                super.signIn(with: credential, completion: completion)
                ,
            defaultCall: __defaultImplStub!.signIn(with: credential, completion: completion))
        
    }
    
    
    
    
    
//     func signIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())  {
//        
//    return cuckoo_manager.call(
//    """
//    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
//    """,
//            parameters: (email, password, completion),
//            escapingParameters: (email, password, completion),
//            superclassCall:
//                
//                super.signIn(withEmail: email, password: password, completion: completion)
//                ,
//            defaultCall: __defaultImplStub!.signIn(withEmail: email, password: password, completion: completion))
//        
//    }
    
    
    
    
    
//     func signIn(with credential: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())  {
//        
//    return cuckoo_manager.call(
//    """
//    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
//    """,
//            parameters: (credential, completion),
//            escapingParameters: (credential, completion),
//            superclassCall:
//                
//                super.signIn(with: credential, completion: completion)
//                ,
//            defaultCall: __defaultImplStub!.signIn(with: credential, completion: completion))
//        
//    }
    
    

     struct __StubbingProxy_FirebaseAuthService: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func signOut() -> Cuckoo.ClassStubNoReturnThrowingFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
    """
    signOut() throws
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
    """
    createUser(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
//        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(AuthCredential, (AuthDataResult?, Error?) -> Void)> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> Void {
//            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
//            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
//    """
//    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void)
//    """, parameterMatchers: matchers))
//        }
//        
        
        
        
//        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
//            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
//            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
//    """
//    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
//    """, parameterMatchers: matchers))
//        }
//        
//        
//        
//        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(AuthCredential, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FirebaseAuthService: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func signOut() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    signOut() throws
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    createUser(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.__DoNotUse<(AuthCredential, (AuthDataResult?, Error?) -> Void), Void> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
//        @discardableResult
//        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (AuthDataResult?, Error?) -> ()), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
//            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
//            return cuckoo_manager.verify(
//    """
//    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
//    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
//        }
//        
//        
//        
//        
//        @discardableResult
//        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.__DoNotUse<(AuthCredential, (AuthDataResult?, Error?) -> ()), Void> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> () {
//            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
//            return cuckoo_manager.verify(
//    """
//    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
//    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
//        }
        
        
    }
}


 class FirebaseAuthServiceStub: FirebaseAuthService {
    

    

    
    
    
    
     override func signOut() throws  {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func signIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func createUser(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func signIn(with credential: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
//     func signIn(withEmail email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())   {
//        return DefaultValueRegistry.defaultValue(for: (Void).self)
//    }
//    
//    
//    
//    
//    
//     func signIn(with credential: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())   {
//        return DefaultValueRegistry.defaultValue(for: (Void).self)
//    }
    
    
}










 class MockOAuthProviderProtocol: OAuthProviderProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = OAuthProviderProtocol
    
     typealias Stubbing = __StubbingProxy_OAuthProviderProtocol
     typealias Verification = __VerificationProxy_OAuthProviderProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: OAuthProviderProtocol?

     func enableDefaultImplementation(_ stub: OAuthProviderProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     var scopes: [String] {
        get {
            return cuckoo_manager.getter("scopes",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.scopes)
        }
        
        set {
            cuckoo_manager.setter("scopes",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.scopes = newValue)
        }
        
    }
    
    
    
    
    
     var providerID: String {
        get {
            return cuckoo_manager.getter("providerID",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.providerID)
        }
        
        set {
            cuckoo_manager.setter("providerID",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.providerID = newValue)
        }
        
    }
    
    
    
    
    
     var provider: OAuthProvider {
        get {
            return cuckoo_manager.getter("provider",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.provider)
        }
        
        set {
            cuckoo_manager.setter("provider",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.provider = newValue)
        }
        
    }
    
    

    

    
    
    
    
     func getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCredentialWith(completion: completion))
        
    }
    
    

     struct __StubbingProxy_OAuthProviderProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var scopes: Cuckoo.ProtocolToBeStubbedProperty<MockOAuthProviderProtocol, [String]> {
            return .init(manager: cuckoo_manager, name: "scopes")
        }
        
        
        
        
        var providerID: Cuckoo.ProtocolToBeStubbedProperty<MockOAuthProviderProtocol, String> {
            return .init(manager: cuckoo_manager, name: "providerID")
        }
        
        
        
        
        var provider: Cuckoo.ProtocolToBeStubbedProperty<MockOAuthProviderProtocol, OAuthProvider> {
            return .init(manager: cuckoo_manager, name: "provider")
        }
        
        
        
        
        
        func getCredentialWith<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((AuthCredential?, Error?) -> Void)> where M1.MatchedType == (AuthCredential?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((AuthCredential?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockOAuthProviderProtocol.self, method:
    """
    getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_OAuthProviderProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var scopes: Cuckoo.VerifyProperty<[String]> {
            return .init(manager: cuckoo_manager, name: "scopes", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var providerID: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "providerID", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var provider: Cuckoo.VerifyProperty<OAuthProvider> {
            return .init(manager: cuckoo_manager, name: "provider", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func getCredentialWith<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((AuthCredential?, Error?) -> Void), Void> where M1.MatchedType == (AuthCredential?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((AuthCredential?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class OAuthProviderProtocolStub: OAuthProviderProtocol {
    
    
    
    
     var scopes: [String] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([String]).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     var providerID: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     var provider: OAuthProvider {
        get {
            return DefaultValueRegistry.defaultValue(for: (OAuthProvider).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     func getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockFirebaseOAuthProvider: FirebaseOAuthProvider, Cuckoo.ClassMock {
    
     typealias MocksType = FirebaseOAuthProvider
    
     typealias Stubbing = __StubbingProxy_FirebaseOAuthProvider
     typealias Verification = __VerificationProxy_FirebaseOAuthProvider

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: FirebaseOAuthProvider?

     func enableDefaultImplementation(_ stub: FirebaseOAuthProvider) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var scopes: [String] {
        get {
            return cuckoo_manager.getter("scopes",
                superclassCall:
                    
                                    super.scopes
                    ,
                defaultCall:  __defaultImplStub!.scopes)
        }
        
        set {
            cuckoo_manager.setter("scopes",
                value: newValue,
                superclassCall:
                    
                    super.scopes = newValue
                    ,
                defaultCall: __defaultImplStub!.scopes = newValue)
        }
        
    }
    
    
    
    
    
     override var providerID: String {
        get {
            return cuckoo_manager.getter("providerID",
                superclassCall:
                    
                                    super.providerID
                    ,
                defaultCall:  __defaultImplStub!.providerID)
        }
        
        set {
            cuckoo_manager.setter("providerID",
                value: newValue,
                superclassCall:
                    
                    super.providerID = newValue
                    ,
                defaultCall: __defaultImplStub!.providerID = newValue)
        }
        
    }
    
    
    
    
    
     override var provider: OAuthProvider {
        get {
            return cuckoo_manager.getter("provider",
                superclassCall:
                    
                                    super.provider
                    ,
                defaultCall:  __defaultImplStub!.provider)
        }
        
        set {
            cuckoo_manager.setter("provider",
                value: newValue,
                superclassCall:
                    
                    super.provider = newValue
                    ,
                defaultCall: __defaultImplStub!.provider = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)
    """,
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.getCredentialWith(completion: completion)
                ,
            defaultCall: __defaultImplStub!.getCredentialWith(completion: completion))
        
    }
    
    

     struct __StubbingProxy_FirebaseOAuthProvider: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var scopes: Cuckoo.ClassToBeStubbedProperty<MockFirebaseOAuthProvider, [String]> {
            return .init(manager: cuckoo_manager, name: "scopes")
        }
        
        
        
        
        var providerID: Cuckoo.ClassToBeStubbedProperty<MockFirebaseOAuthProvider, String> {
            return .init(manager: cuckoo_manager, name: "providerID")
        }
        
        
        
        
        var provider: Cuckoo.ClassToBeStubbedProperty<MockFirebaseOAuthProvider, OAuthProvider> {
            return .init(manager: cuckoo_manager, name: "provider")
        }
        
        
        
        
        
        func getCredentialWith<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<((AuthCredential?, Error?) -> Void)> where M1.MatchedType == (AuthCredential?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((AuthCredential?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseOAuthProvider.self, method:
    """
    getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FirebaseOAuthProvider: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var scopes: Cuckoo.VerifyProperty<[String]> {
            return .init(manager: cuckoo_manager, name: "scopes", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var providerID: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "providerID", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var provider: Cuckoo.VerifyProperty<OAuthProvider> {
            return .init(manager: cuckoo_manager, name: "provider", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func getCredentialWith<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<((AuthCredential?, Error?) -> Void), Void> where M1.MatchedType == (AuthCredential?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((AuthCredential?, Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify(
    """
    getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FirebaseOAuthProviderStub: FirebaseOAuthProvider {
    
    
    
    
     override var scopes: [String] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([String]).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var providerID: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var provider: OAuthProvider {
        get {
            return DefaultValueRegistry.defaultValue(for: (OAuthProvider).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func getCredentialWith(completion: @escaping (AuthCredential?, Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




