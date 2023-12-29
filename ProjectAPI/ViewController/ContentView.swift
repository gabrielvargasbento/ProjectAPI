//
//  ContentView.swift
//  ProjectAPI
//
//  Created by Gabriel vARGAS on 27/12/23.
//

import SwiftUI

class TabSelectionManager: ObservableObject {
    @Published var selectedTabIndex = 0
}

struct ContentView: View {
    @StateObject var tabSelectionManager: TabSelectionManager
    @StateObject var routerManager: NavigationRouter

    var body: some View {
        TabView(selection: $tabSelectionManager.selectedTabIndex) {
            ListRepositoriesView()
                .tabItem {
                    Label("GitHub", systemImage: "octagon")
                }
                .tag(0)

            ListHarryPotterView()
                .tabItem {
                    Label("Harry Potter", systemImage: "eyeglasses")
                }
                .tag(1)

            NotificationView()
                .tabItem {
                    Label("Notificação", systemImage: "bell")
                }
                .tag(2)
        }
        .environmentObject(routerManager)
    }
}
