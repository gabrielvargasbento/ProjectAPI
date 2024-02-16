//
//  ContentView.swift
//  ProjectAPI
//
//  Created by Gabriel vARGAS on 27/12/23.
//

import SwiftUI
import CwlCatchException

struct ContentView: View {

    var body: some View {
        TabView{
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
            ListMarvelView()
                .tabItem {
                    Image(systemName: "m.circle")
                    Text("Marvel")
                }
                .tag(2)
            NotificationView()
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
                .tag(3)
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "person.circle")
                }
                .tag(4)
        }
    }
}
