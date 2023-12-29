//
//  ListView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 12/12/23.
//

import SwiftUI

struct ListRepositoriesView: View {
    
    @EnvironmentObject var routerManager: NavigationRouter
    @ObservedObject var repoViewModel = RepositoriesViewModel()
    let firebaseService = FirebaseService()
    
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
            print("open")
            repoViewModel.fetchRepositories()
            print(repoViewModel.apiService.apiList.count)
            firebaseService.analytics(userName: "repository_menu", className: "repository")
            routerManager.reset()
        }
        .environmentObject(routerManager)
    }
}

