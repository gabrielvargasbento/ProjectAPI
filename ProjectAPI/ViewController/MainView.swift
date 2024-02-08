//
//  MainView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/12/23.
//

import SwiftUI
import CwlCatchException

@main
struct MainView: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var routerManager = NavigationRouter()
//    @StateObject private var tabIndexManager = TabIndexManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    Task {
                        await handleDeepLink(from: url)
                    }
                }
                .onAppear {
                    delegate.app = self
                }
            
                .environmentObject(routerManager)
//                .environmentObject(tabIndexManager)
        }
    }
}

extension MainView {
    
    func handleDeepLink(from url: URL) async {
        let routeFinder = RouteFinder()
        routeFinder.find(from: url) { (result, error) in
            switch result {
                
            case .repositoryItem(let item):
                routerManager.reset()
//              tabIndexManager.selectedTabIndex = 0
                routerManager.push(to: .repositoryItem(item: item))
                
            case .harryPotterItem(let item):
                routerManager.reset()
//              tabIndexManager.selectedTabIndex = 1
                routerManager.push(to: .harryPotterItem(item: item))
                
                
            case .repositoryMenu:
                routerManager.reset()
//              tabIndexManager.selectedTabIndex = 0
                routerManager.push(to: .repositoryMenu)
                
            case .harryPotterMenu:
                routerManager.reset()
//              tabIndexManager.selectedTabIndex = 1
                routerManager.push(to: .harryPotterMenu)
                
            default:
                break
            }
        }
    }
}
