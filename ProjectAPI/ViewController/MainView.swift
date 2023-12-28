//
//  MainView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/12/23.
//

import SwiftUI
import FirebaseCore
import UserNotifications
import FirebaseMessaging
import FirebaseAnalytics

@main
struct MainView: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var routerManager = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(routerManager)
                .onOpenURL { url in
                    let routeFinder = RouteFinder()
                    routeFinder.find(from: url) { result in
                        switch result {
                        case .repositoryItem(let item):
                            routerManager.reset()
                            routerManager.push(to: .repositoryItem(item: item))
                            
                        case .repositoryMenu:
                            routerManager.reset()
                            routerManager.push(to: .repositoryMenu)
                            
                        case .harryPotterMenu:
                            routerManager.reset()
                            routerManager.push(to: .harryPotterMenu)
                        default:
                            break
                        }
                    }
                }
        }
    }
}

