//
//  ListView.swift
//  GitHubList
//
//  Created by dti Digital on 12/12/23.
//

import SwiftUI
import FirebaseAnalytics

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
                    }
            }
        }.onAppear() {
            repoViewModel.fetchRepositories()
            firebaseService.analytics(userName: "repository_menu", className: "repository")
        }
        
    }
}

