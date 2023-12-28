//
//  Route.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 26/12/23.
//

import Foundation
import SwiftUI

enum Route {
    
    case repositoryItem(item: any RepositoryItem)
    case harryPotterItem(item: any HarryPotterItem)
    
    case repositoryMenu
    case harryPotterMenu
}

extension Route: Hashable {
    
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
            AccountView(account: item as! Repository)
        case .harryPotterItem(item: let item):
            CharacterView(character: item as! HarryPotter)
            
        case .harryPotterMenu:
            ListHarryPotterView()
        case .repositoryMenu:
            ListRepositoriesView()
        }
    }
    
}
