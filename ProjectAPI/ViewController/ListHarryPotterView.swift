//
//  ListView.swift
//  GitHubList
//
//  Created by dti Digital on 12/12/23.
//

import SwiftUI

struct ListHarryPotterView: View {
    
    @ObservedObject var harrypotterViewModel = HarryPotterViewModel()
    let firebaseService = FirebaseService()

    var body: some View {
        
        NavigationStack {
            
            Text("Personagens do Harry Potter")
                .bold()
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
            
            ZStack {
                List(harrypotterViewModel.apiService.apiList) { item in
                        NavigationLink(
                            destination: CharacterView(
                                name: item.name,
                                house: item.house,
                                dateOfBirth: item.dateOfBirth,
                                actor: item.actor,
                                image: item.image)) {
                            Text(item.name ?? "Nome não disponível")
                        }
                    }
            }
        }.onAppear() {
            harrypotterViewModel.fetchHarryPotter()
            firebaseService.analytics(userName: "harrypotter_menu", className: "harrypotter")
        }
        
    }
}


