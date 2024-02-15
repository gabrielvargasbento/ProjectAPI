//
//  ListMarvelView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/02/24.
//

import SwiftUI

struct ListMarvelView: View {
    
    @EnvironmentObject var routerManager: NavigationRouter
    @ObservedObject var marvelViewModel = MarvelViewModel()
    
    let firebaseService = AnalyticsService()
    
    var body: some View {
        
        NavigationStack(path: $routerManager.routes) {
            
            List {
                Section("Marvel Characters") {
                    ForEach(marvelViewModel.marvelCharacters) { item in
                        NavigationLink(value: Route.marvelItem(item: item)) {
                            Text("\(item.id) - \(item.name!)")
                        }
                        .onTapGesture {
                            firebaseService.buttonEvent(buttonName: item.name ?? "")
                        }
                    }
                }
            }
            .navigationTitle("Marvel")
            .navigationDestination(for: Route.self) { $0 }
        }
        .onAppear() {
            marvelViewModel.fetchData()
            firebaseService.analytics(userName: "marvel_menu", className: "marvel")
            routerManager.reset()
        }
        .alert(isPresented: $marvelViewModel.hasError,
               error: marvelViewModel.error) {
            Button(action: marvelViewModel.fetchData) {
                Text("Retry")
            }
        }
    }
}

