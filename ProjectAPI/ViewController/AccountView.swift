//
//  AccountView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 12/12/23.
//

import SwiftUI

struct AccountView: View {
    
    let account: Repository
    let firebaseService = FirebaseService()
    @EnvironmentObject var routerManager: NavigationRouter

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: account.owner!.avatarUrl!),
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
            
            Text(account.name ?? "")
                .bold()
            
            Text(account.owner!.login ?? "")
                .bold()
            
            Text(account.description ?? "")
            
            Link(destination: URL(string: account.owner!.htmlUrl!)!) {
                Text("Acessar GitHub")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .onTapGesture {
                firebaseService.buttonEvent(buttonName: "GitHub: \(String(describing: account.name))")
            }
            Spacer()
        }
        .onAppear() {
            firebaseService.analytics(userName: account.name!, className: "repository")
        }
        .onDisappear() {
            routerManager.reset()
        }
    }
}
