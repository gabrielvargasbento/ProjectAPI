//
//  AccountView.swift
//  CharacterView
//
//  Created by dti Digital on 15/12/23.
//

import SwiftUI

struct CharacterView: View {
    
    let name: String?
    let house: String?
    let dateOfBirth: String?
    let actor: String?
    let image: String?
    
    let firebaseService = FirebaseService()

    var body: some View {
        
        VStack {
            AsyncImage(
                url: URL(string: image!),
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
            
            Text(name ?? "")
                .bold()
            
            Text(house ?? "")
            
            Text(dateOfBirth ?? "")
            
            
            Text(actor ?? "")
            
            Button("Crash") {
              fatalError("Crash was triggered")
            }

            Spacer()
        }
        .onAppear() {
            firebaseService.analytics(userName: name!, className: "harrypotter")
        }
    }
}
