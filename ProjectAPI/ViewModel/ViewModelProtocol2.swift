//
//  ViewModelProtocol2.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 16/02/24.
//

import Foundation

protocol ViewModelProtocol2 {
    associatedtype T: Decodable
    
    var apiService: APIServiceCombine<T> { get set }
    var url: URL { get }
    
    func fetchData()
    func fetchDataItem(identifier: String?)
}
