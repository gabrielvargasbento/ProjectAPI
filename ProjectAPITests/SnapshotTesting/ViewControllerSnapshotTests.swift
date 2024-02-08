////
////  ViewControllerSnapshotTests.swift
////  ProjectAPITests
////
////  Created by Gabriel Vargas on 07/02/24.
////
//
import XCTest
import SnapshotTesting

@testable import ProjectAPI

class ViewControllerSnapshotTests: XCTestCase {
    
  func testLoginView() {
      let sut = LoginView()
      assertSnapshot(of: sut, as: .image)
  }
}

//import Quick
//import Nimble
//import Nimble_Snapshots
//
//
//class ViewControllerSnapshotTests2: QuickSpec {
//    
//    override class func spec() {
//        describe("Login View Controller Tests") {
//            
//            it("has valid snapshot") {
//                let view = LoginView()
//                expect(view).to( haveValidSnapshot() )
//            }
//            
//        }
//    }
//}

//recordSnapshot(named: "LoginViewSnapshot" )
