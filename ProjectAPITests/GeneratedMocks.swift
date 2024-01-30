// MARK: - Mocks generated from file: ProjectAPI/Model/HarryPotter.swift at 2024-01-29 16:26:47 +0000

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





// MARK: - Mocks generated from file: ProjectAPI/Model/Repository.swift at 2024-01-29 16:26:47 +0000

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





// MARK: - Mocks generated from file: ProjectAPI/Services/AnalyticsService.swift at 2024-01-29 16:26:47 +0000

//
//  AnalyticsService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 23/12/19.
//

import Cuckoo
@testable import ProjectAPI

import Firebase






 class MockFirebaseAnalytics2: FirebaseAnalytics, Cuckoo.ProtocolMock {
    
     typealias MocksType = FirebaseAnalytics
    
     typealias Stubbing = __StubbingProxy_FirebaseAnalytics
     typealias Verification = __VerificationProxy_FirebaseAnalytics

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FirebaseAnalytics?

     func enableDefaultImplementation(_ stub: FirebaseAnalytics) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func logEvent(_ name: String, parameters: [String: Any]?)  {
        
    return cuckoo_manager.call(
    """
    logEvent(_: String, parameters: [String: Any]?)
    """,
            parameters: (name, parameters),
            escapingParameters: (name, parameters),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.logEvent(name, parameters: parameters))
        
    }
    
    

     struct __StubbingProxy_FirebaseAnalytics: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
//        func logEvent<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ name: M1, parameters: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, [String: Any]?)> where M1.MatchedType == String, M2.OptionalMatchedType == [String: Any] {
//            let matchers: [Cuckoo.ParameterMatcher<(String, [String: Any]?)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: parameters) { $0.1 }]
//            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAnalytics.self, method:
//    """
//    logEvent(_: String, parameters: [String: Any]?)
//    """, parameterMatchers: matchers))
//        }
        
        
    }

     struct __VerificationProxy_FirebaseAnalytics: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func logEvent<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ name: M1, parameters: M2) -> Cuckoo.__DoNotUse<(String, [String: Any]?), Void> where M1.MatchedType == String, M2.OptionalMatchedType == [String: Any] {
            let matchers: [Cuckoo.ParameterMatcher<(String, [String: Any]?)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: parameters) { $0.1 }]
            return cuckoo_manager.verify(
    """
    logEvent(_: String, parameters: [String: Any]?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FirebaseAnalyticsStub: FirebaseAnalytics {
    

    

    
    
    
    
     func logEvent(_ name: String, parameters: [String: Any]?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockFirebaseAnalyticsImpl: FirebaseAnalyticsImpl, Cuckoo.ClassMock {
    
     typealias MocksType = FirebaseAnalyticsImpl
    
     typealias Stubbing = __StubbingProxy_FirebaseAnalyticsImpl
     typealias Verification = __VerificationProxy_FirebaseAnalyticsImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: FirebaseAnalyticsImpl?

     func enableDefaultImplementation(_ stub: FirebaseAnalyticsImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func logEvent(_ name: String, parameters: [String: Any]?)  {
        
    return cuckoo_manager.call(
    """
    logEvent(_: String, parameters: [String: Any]?)
    """,
            parameters: (name, parameters),
            escapingParameters: (name, parameters),
            superclassCall:
                
                super.logEvent(name, parameters: parameters)
                ,
            defaultCall: __defaultImplStub!.logEvent(name, parameters: parameters))
        
    }
    
    

     struct __StubbingProxy_FirebaseAnalyticsImpl: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func logEvent<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ name: M1, parameters: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, [String: Any]?)> where M1.MatchedType == String, M2.OptionalMatchedType == [String: Any] {
            let matchers: [Cuckoo.ParameterMatcher<(String, [String: Any]?)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: parameters) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAnalyticsImpl.self, method:
    """
    logEvent(_: String, parameters: [String: Any]?)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FirebaseAnalyticsImpl: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func logEvent<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ name: M1, parameters: M2) -> Cuckoo.__DoNotUse<(String, [String: Any]?), Void> where M1.MatchedType == String, M2.OptionalMatchedType == [String: Any] {
            let matchers: [Cuckoo.ParameterMatcher<(String, [String: Any]?)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: parameters) { $0.1 }]
            return cuckoo_manager.verify(
    """
    logEvent(_: String, parameters: [String: Any]?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FirebaseAnalyticsImplStub: FirebaseAnalyticsImpl {
    

    

    
    
    
    
     override func logEvent(_ name: String, parameters: [String: Any]?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockAnalyticsService: AnalyticsService, Cuckoo.ClassMock {
    
     typealias MocksType = AnalyticsService
    
     typealias Stubbing = __StubbingProxy_AnalyticsService
     typealias Verification = __VerificationProxy_AnalyticsService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: AnalyticsService?

     func enableDefaultImplementation(_ stub: AnalyticsService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func analytics(userName: String, className: String)  {
        
    return cuckoo_manager.call(
    """
    analytics(userName: String, className: String)
    """,
            parameters: (userName, className),
            escapingParameters: (userName, className),
            superclassCall:
                
                super.analytics(userName: userName, className: className)
                ,
            defaultCall: __defaultImplStub!.analytics(userName: userName, className: className))
        
    }
    
    
    
    
    
     override func buttonEvent(buttonName: String)  {
        
    return cuckoo_manager.call(
    """
    buttonEvent(buttonName: String)
    """,
            parameters: (buttonName),
            escapingParameters: (buttonName),
            superclassCall:
                
                super.buttonEvent(buttonName: buttonName)
                ,
            defaultCall: __defaultImplStub!.buttonEvent(buttonName: buttonName))
        
    }
    
    

     struct __StubbingProxy_AnalyticsService: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func analytics<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(userName: M1, className: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: userName) { $0.0 }, wrap(matchable: className) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAnalyticsService.self, method:
    """
    analytics(userName: String, className: String)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func buttonEvent<M1: Cuckoo.Matchable>(buttonName: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: buttonName) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAnalyticsService.self, method:
    """
    buttonEvent(buttonName: String)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_AnalyticsService: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func analytics<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(userName: M1, className: M2) -> Cuckoo.__DoNotUse<(String, String), Void> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: userName) { $0.0 }, wrap(matchable: className) { $0.1 }]
            return cuckoo_manager.verify(
    """
    analytics(userName: String, className: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func buttonEvent<M1: Cuckoo.Matchable>(buttonName: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: buttonName) { $0 }]
            return cuckoo_manager.verify(
    """
    buttonEvent(buttonName: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class AnalyticsServiceStub: AnalyticsService {
    

    

    
    
    
    
     override func analytics(userName: String, className: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func buttonEvent(buttonName: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: ProjectAPI/Services/LoginService.swift at 2024-01-29 16:26:47 +0000

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
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with credential: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(AuthCredential, (AuthDataResult?, Error?) -> Void)> where M1.MatchedType == AuthCredential, M2.MatchedType == (AuthDataResult?, Error?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, (AuthDataResult?, Error?) -> Void)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
    """
    signIn(with: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, (AuthDataResult?, Error?) -> ())> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (AuthDataResult?, Error?) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (AuthDataResult?, Error?) -> ())>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirebaseAuthService.self, method:
    """
    signIn(withEmail: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
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
    
    
}










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
    
    
    
    
    
     override func login(email: String, password: String)  {
        
    return cuckoo_manager.call(
    """
    login(email: String, password: String)
    """,
            parameters: (email, password),
            escapingParameters: (email, password),
            superclassCall:
                
                super.login(email: email, password: password)
                ,
            defaultCall: __defaultImplStub!.login(email: email, password: password))
        
    }
    
    
    
    
    
     override func register(email: String, password: String)  {
        
    return cuckoo_manager.call(
    """
    register(email: String, password: String)
    """,
            parameters: (email, password),
            escapingParameters: (email, password),
            superclassCall:
                
                super.register(email: email, password: password)
                ,
            defaultCall: __defaultImplStub!.register(email: email, password: password))
        
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
        
        
        
        
        
        func logout() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    logout()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(email: M1, password: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    login(email: String, password: String)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func register<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(email: M1, password: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginService.self, method:
    """
    register(email: String, password: String)
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
        
        
    
        
        
        
        @discardableResult
        func logout() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    logout()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(email: M1, password: M2) -> Cuckoo.__DoNotUse<(String, String), Void> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return cuckoo_manager.verify(
    """
    login(email: String, password: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func register<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(email: M1, password: M2) -> Cuckoo.__DoNotUse<(String, String), Void> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return cuckoo_manager.verify(
    """
    register(email: String, password: String)
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
    
    

    

    
    
    
    
     override func logout()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func login(email: String, password: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func register(email: String, password: String)   {
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





