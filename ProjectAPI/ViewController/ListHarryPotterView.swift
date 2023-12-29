//
//  ListView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 12/12/23.
//

import SwiftUI

struct ListHarryPotterView: View {
    
    @EnvironmentObject var routerManager: NavigationRouter
    @ObservedObject var harrypotterViewModel = HarryPotterViewModel()
    let firebaseService = FirebaseService()
    
    var body: some View {
        
        NavigationStack(path: $routerManager.routes) {
            
            List {
                Section("Personagens") {
                    ForEach(harrypotterViewModel.apiService.apiList) { item in
                        NavigationLink(value: Route.harryPotterItem(item: item)) {
                            Text(item.name!)
                        }
                        .onTapGesture {
                            firebaseService.buttonEvent(buttonName: item.name ?? "")
                        }
                    }
                }
            }
            .navigationTitle("Harry Potter")
            .navigationDestination(for: Route.self) { $0 }
        }
        .onAppear() {
            harrypotterViewModel.fetchHarryPotter()
            firebaseService.analytics(userName: "harrypotter_menu", className: "harrypotter")
            routerManager.reset()
        }
        .environmentObject(routerManager)
    }
}
