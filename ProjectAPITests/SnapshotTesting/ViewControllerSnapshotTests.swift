//
//  ViewControllerSnapshotTests.swift
//  ProjectAPITests
//
//  Created by Gabriel Vargas on 07/02/24.
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
