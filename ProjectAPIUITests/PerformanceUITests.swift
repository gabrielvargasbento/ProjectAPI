//
//  PerformanceUITests.swift
//  ProjectAPIUITests
//
//  Created by Gabriel Vargas on 02/02/24.
//

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

//measure(_:)
//Records the default performance metrics for the duration of execution of the block argument, using the default measure options.
//measureMetrics(_:automaticallyStartMeasuring:for:)
//Records the specified performance metrics, either for the duration of execution of the block argument, or, if you pass false for the automaticallyStartMeasuring parameter, between calls to startMeasuring() and stopMeasuring() within the block argument.
//measure(metrics:block:)
//Records the specified metrics for the duration of execution of the block argument, using the default measure options.
//measure(metrics:options:block:)
//Records the specified metrics, either for the duration of execution of the block argument or between calls to startMeasuring() and stopMeasuring() within the block argument, depending on the specified measure options.
//measure(options:block:)
//Records the default metrics, either for the duration of execution of the block argument or between calls to startMeasuring() and stopMeasuring() within the block argument, depending on the specified measure options.

