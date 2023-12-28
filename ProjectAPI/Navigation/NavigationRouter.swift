//
//  NavigationRouter.swift
//  ProjectAPI
//
//  Created by dti Digital on 26/12/23.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes = [Route]()
    
    func push(to screen: Route) {
//        guard !routes.contains(screen) else {
//            return
//        }
        routes.append(screen)
    }
    
    func reset() {
        routes = []
    }
}
