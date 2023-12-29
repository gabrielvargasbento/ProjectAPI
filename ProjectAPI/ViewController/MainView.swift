//
//  MainView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/12/23.
//

import SwiftUI

@main
struct MainView: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var tabSelectionManager = TabSelectionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(tabSelectionManager: tabSelectionManager, routerManager: routerManager)
                .onOpenURL { url in
                    let routeFinder = RouteFinder()
                    routeFinder.find(from: url) { result in
                        switch result {
                        case .repositoryItem(let item):
                            routerManager.reset()
                            tabSelectionManager.selectedTabIndex = 0
                            routerManager.push(to: .repositoryItem(item: item))
                            
                        case .repositoryMenu:
                            tabSelectionManager.selectedTabIndex = 0
                            routerManager.reset()
                            routerManager.push(to: .repositoryMenu)
                            
                        case .harryPotterMenu:
                            tabSelectionManager.selectedTabIndex = 1
                            routerManager.reset()
                            routerManager.push(to: .harryPotterMenu)
                            
                        default:
                            break
                        }
                    }
                }
        }
        .environmentObject(routerManager)
    }
}
