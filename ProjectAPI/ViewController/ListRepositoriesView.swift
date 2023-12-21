//
//  ListView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 12/12/23.
//

import SwiftUI

struct ListRepositoriesView: View {
    
    @ObservedObject var repoViewModel = RepositoriesViewModel()
    let firebaseService = FirebaseService()
    
    var body: some View {
        
        NavigationStack {
            
            Text("Repositórios do GitHub")
                .bold()
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
            
            ZStack {
                List(repoViewModel.apiService.apiList) { item in
                    NavigationLink(
                        destination: AccountView(
                            id: item.id,
                            avatarUrl: item.owner.avatarUrl,
                            name: item.name,
                            description: item.description,
                            htmlUrl: item.owner.htmlUrl)) {
                                Text(item.name ?? "Nome não disponível")
                            }
                            .onTapGesture {
                                firebaseService.buttonEvent(buttonName: item.name!)
                            }
                }
            }
        }.onAppear() {
            repoViewModel.fetchRepositories()
            firebaseService.analytics(userName: "repository_menu", className: "repository")
        }
        
    }
}

