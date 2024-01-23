//
//  Route.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 26/12/23.
//

import Foundation
import SwiftUI

enum Route {
    
    case repositoryItem(item: Repository)
    case harryPotterItem(item: HarryPotter)
    
    case repositoryMenu
    case harryPotterMenu
}

extension Route: Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch(lhs, rhs) {
        case (.repositoryItem(let lhsItem), .repositoryItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.harryPotterItem(let lhsItem), .harryPotterItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.harryPotterMenu, .harryPotterMenu):
            return true
        case (.repositoryMenu, .repositoryMenu):
            return true
        default:
            return false
        }
    }
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .repositoryItem(item: let item):
            AccountView(account: item)
        case .harryPotterItem(item: let item):
            CharacterView(character: item)
            
        case .harryPotterMenu:
            ListHarryPotterView()
        case .repositoryMenu:
            ListRepositoriesView()
        }
    }
    
}
