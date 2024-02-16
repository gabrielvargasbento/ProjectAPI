//
//  ListMarvelView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/02/24.
//

import SwiftUI

struct ListMarvelView: View {
    
    @EnvironmentObject var routerManager: NavigationRouter
    @ObservedObject var marvelViewModel = MarvelCombineViewModel()
    let firebaseService = AnalyticsService()
    
    @State private var isFetchingData: Bool = false
    @State private var marvelCharacters: [MarvelCharacter] = []
        
    var body: some View {
        
        NavigationStack(path: $routerManager.routes) {
            
            ZStack {
                if (isFetchingData && marvelCharacters.isEmpty) {
                    ProgressView()
                    
                } else {
                    List {
                        Section("Marvel Characters") {
                            ForEach(marvelCharacters) { item in
                                NavigationLink(destination: Route.marvelItem(item: item)) {
                                    Text("\(item.id) - \(item.name ?? "")")
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
            }
            .onAppear() {
                marvelViewModel.fetchData()
                firebaseService.analytics(userName: "marvel_menu", className: "marvel")
                routerManager.reset()
            }
            .alert(isPresented: $marvelViewModel.apiService.hasError,
                   error: marvelViewModel.apiService.error) {
                Button(action: marvelViewModel.fetchData) {
                    Text("Retry")
                }
            }
            .onReceive(marvelViewModel.apiService.$isRefreshing) { isRefreshing in
                isFetchingData = isRefreshing
                marvelCharacters = marvelViewModel.apiService.apiListItem?.data.results ?? []
            }
        }
    }
}

