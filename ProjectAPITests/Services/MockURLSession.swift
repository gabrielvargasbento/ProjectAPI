////
////  MockURLSession.swift
////  ProjectAPITests
////
////  Created by Gabriel Vargas on 18/01/24.
////
//
//import Foundation
//import ProjectAPI
//
//class MockURLSession: URLSession {
//    let mockData: Data?
//    let mockResponse: URLResponse?
//    let mockError: ProviderError?
//    var dataTask: MockURLSessionDataTask!
//
//    init(mockData: Data?, mockResponse: URLResponse?, mockError: ProviderError?) {
//        self.mockData = mockData
//        self.mockResponse = mockResponse
//        self.mockError = mockError
//        super.init()
//        self.dataTask = MockURLSessionDataTask()
//    }
//
//    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        dataTask.completionHandler = completionHandler
//        return dataTask
//    }
//}
//
//class MockURLSessionDataTask: URLSessionDataTask {
//    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)!
//
//    override func resume() {
//        completionHandler(mockData, mockResponse, mockError)
//    }
//}
//
