//
//  ListView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 12/12/23.
//

import SwiftUI

struct ListRepositoriesView: View {
    
    @EnvironmentObject var routerManager: NavigationRouter
//    @EnvironmentObject private var tabIndexManager: TabIndexManager

    @ObservedObject var repoViewModel = RepositoriesViewModel()
    let firebaseService = AnalyticsService()
    
    var body: some View {
        
        NavigationStack(path: $routerManager.routes) {
            
            List {
                Section("Repositórios") {
                    ForEach(repoViewModel.apiService.apiList) { item in
                        NavigationLink(value: Route.repositoryItem(item: item)) {
                            Text("\(item.id) - \(item.name!)")
                        }
                        .onTapGesture {
                            firebaseService.buttonEvent(buttonName: item.name ?? "")
                        }
                    }
                }
            }
            .navigationTitle("GitHub")
            .navigationDestination(for: Route.self) { $0 }
        }
        .onAppear() {
//            tabIndexManager.selectedTabIndex = 0
            repoViewModel.fetch() { (repo, error) in }
            firebaseService.analytics(userName: "repository_menu", className: "repository")
            routerManager.reset()
        }
//        .environmentObject(routerManager)
//        .environmentObject(tabIndexManager)
    }
}

