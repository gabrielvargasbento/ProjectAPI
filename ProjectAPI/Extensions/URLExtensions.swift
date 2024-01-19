//
//  URLExtensions.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 18/01/24.
//

import Foundation

extension URL {
    public var queryParamaters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value?.replacingOccurrences(of: "+", with: " ")
        }
    }
}
