//
//  PerformanceUITests.swift
//  ProjectAPIUITests
//
//  Created by Gabriel Vargas on 02/02/24.
//


//@testable import ProjectAPI

import XCTest

final class PerformanceUITests: XCTestCase {
    
    func testLaunchPerformance() throws {
        measure(metrics: [
            XCTApplicationLaunchMetric(),
            XCTMemoryMetric(),
            XCTCPUMetric(),
            XCTStorageMetric(),
            XCTClockMetric()
        ]) {
            XCUIApplication().launch()
        }
    }
}
