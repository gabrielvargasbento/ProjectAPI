//
//  ViewModelProtocol.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 22/01/24.
//

import Foundation
import CwlCatchException

protocol ViewModelProtocol {
    associatedtype T: Decodable
    var apiService: APIService<T> { get }
    var url: URL { get }
    func fetch(completion: @escaping ([T]?, Error?) -> ())
    func fetchItem(identifier: String?, completion: @escaping (T?, Error?) -> ())
}
