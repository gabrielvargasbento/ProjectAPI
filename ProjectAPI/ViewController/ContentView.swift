//
//  ContentView.swift
//  ProjectAPI
//
//  Created by Gabriel vARGAS on 27/12/23.
//

import SwiftUI

//class TabIndexManager: ObservableObject {
//    @Published var selectedTabIndex: Int = 0
//}

struct ContentView: View {
//    @EnvironmentObject private var tabIndexManager: TabIndexManager

    var body: some View {
        TabView{ //(selection: $tabIndexManager.selectedTabIndex) {
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
//        .environmentObject(tabIndexManager)
    }
}
