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
                .onOpenURL{ url in
                    let routeFinder = RouteFinder()
                    if let route = routeFinder.find(from: url) {
                        routerManager.reset()
                        routerManager.push(to: route)
                    }
                }
        }
    }
}
