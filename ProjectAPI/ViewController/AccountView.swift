//
//  AccountView.swift
//  ProjectAPI
//
//  Created by dti Digital on 12/12/23.
//

import SwiftUI

struct AccountView: View {
    
    let id: Int?
    let avatarUrl: String?
    let name: String?
    let description: String?
    let htmlUrl: String?
    
    let apiService = APIService<Repository>()

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: avatarUrl!),
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
            
            Text(description ?? "")
            
            Link(destination: URL(string: htmlUrl!)!) {
                Text("Acessar GitHub")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Spacer()
        }
        .onAppear() {
            apiService.analytics(nome: name!, classe: "repository")
        }
    }
}
