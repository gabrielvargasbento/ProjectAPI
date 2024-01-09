//
//  CharacterView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/12/23.
//

import SwiftUI

struct CharacterView: View {
    
    let character: HarryPotter
    let firebaseService = AnalyticsService()
    @EnvironmentObject var routerManager: NavigationRouter

    var body: some View {
        
        VStack {
            AsyncImage(
                url: URL(string: character.image!),
                content: { img in
                    img
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)
                },
                placeholder: { ProgressView()}
            )
            .padding(20)
            
            Text(character.name ?? "")
                .bold()
            
            Text(character.house ?? "")
            
            Text(character.dateOfBirth ?? "")
            
            
            Text(character.actor ?? "")
            
            Button("Crash") {
                fatalError("Crash was triggered")
            }
            
            Spacer()
        }
        .onAppear() {
            firebaseService.analytics(userName: character.name!, className: "harrypotter")
        }
        .onDisappear() {
            routerManager.reset()
        }
    }
}
