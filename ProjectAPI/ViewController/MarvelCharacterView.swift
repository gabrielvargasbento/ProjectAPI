//
//  MarvelCharacterView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/01/24.
//

import SwiftUI

struct MarvelCharacterView: View {
    
    let character: MarvelCharacter
    let firebaseService = AnalyticsService()
    @EnvironmentObject var routerManager: NavigationRouter

    var body: some View {
        
        VStack {
            
            Text(character.name ?? "")
                .bold()
        }
        .onAppear() {
            firebaseService.analytics(userName: character.name!, className: "marvel")
        }
        .onDisappear() {
            routerManager.reset()
        }
    }
}
