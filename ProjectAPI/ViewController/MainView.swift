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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var fcmRegTokenMessage: String = ""

    var body: some View {
        TabView {
            ListRepositoriesView()
                .tabItem {
                    Label("GitHub", systemImage: "octagon")
                }
            ListHarryPotterView()
                .tabItem {
                    Label("Harry Potter", systemImage: "eyeglasses")
                }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: Notification.Name("FCMToken"), object: nil, queue: nil) { notification in
                if let userInfo = notification.userInfo, let token = userInfo["token"] as? String {
                    // Atualizar a propriedade com o token FCM
                    self.fcmRegTokenMessage = "Remote FCM registration token: \(token)"
                }
            }
        }
    }
}
