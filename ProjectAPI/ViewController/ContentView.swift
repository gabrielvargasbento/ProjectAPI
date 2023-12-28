//
//  ContentView.swift
//  ProjectAPI
//
//  Created by Gabriel vARGAS on 27/12/23.
//

import SwiftUI

struct ContentView: View {
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
            NotificationView()
                .tabItem {
                    Label("Notificação", systemImage: "bell")
                }
        }
    }
}
