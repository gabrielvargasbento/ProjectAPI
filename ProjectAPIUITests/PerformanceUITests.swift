//
//  PerformanceUITests.swift
//  ProjectAPIUITests
//
//  Created by Gabriel Vargas on 02/02/24.
//

import XCTest

final class TesteUITests: XCTestCase {

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
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
}
