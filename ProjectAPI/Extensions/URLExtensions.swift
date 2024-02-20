//
//  URLExtensions.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 18/01/24.
//

import Foundation
import CwlCatchException


/**
 Extension of the URL class.
 */
extension URL {
    
    /**
     Property to retrieve query parameters from the URL, replacing "+" with " ".
     
     - Returns: A dictionary containing query parameter keys and values if they exist, otherwise nil.
     */
    public var queryParamaters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value?.replacingOccurrences(of: "+", with: " ")
        }
    }
}
