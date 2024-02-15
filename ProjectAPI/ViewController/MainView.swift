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
                routerManager.push(to: .repositoryItem(item: item))
                
            case .harryPotterItem(let item):
                routerManager.reset()
                routerManager.push(to: .harryPotterItem(item: item))
                
            case .marvelItem(let item):
                routerManager.reset()
                routerManager.push(to: .marvelItem(item: item))
                                
            case .repositoryMenu:
                routerManager.reset()
                routerManager.push(to: .repositoryMenu)
                
            case .harryPotterMenu:
                routerManager.reset()
                routerManager.push(to: .harryPotterMenu)
                
            case .marvelMenu:
                routerManager.reset()
                routerManager.push(to: .marvelMenu)
                
            default:
                break
            }
        }
    }
}
