//
//  Repository.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation

protocol RepositoryItem {
    var id: Int { get }
    var name: String? { get }
    var fullName: String? { get }
    var owner: Owner? { get }
    var description: String? { get }
}

// Structs para armazenar os repositorios da API

struct Repository: Codable, Hashable, Identifiable, RepositoryItem {
    
    let id: Int
    let name: String?
    let fullName: String?
    let owner: Owner?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, owner, description
        case fullName = "full_name"
    }
}

struct Owner: Codable, Hashable, Identifiable {
    let login: String?
    let id: Int
    let avatarUrl: String?
    let htmlUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}

#if UITEST
let owner1 = Owner(login: "mojombo", id: 1, avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", htmlUrl: "https://github.com/mojombo")
let repo1 = Repository(id: 1, name: "grit", fullName: "mojombo/grit", owner: owner1, description: "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.")

let owner2 = Owner(login: "wycats", id: 4, avatarUrl: "https://avatars.githubusercontent.com/u/4?v=4", htmlUrl: "https://github.com/wycats")
let repo2 = Repository(id: 26, name: "merb-core", fullName: "wycats/merb-core", owner: owner2, description: "Merb Core: All you need. None you don't.")

let owner3 = Owner(login: "rubinius", id: 317747, avatarUrl: "https://avatars.githubusercontent.com/u/317747?v=4", htmlUrl: "https://github.com/rubinius")
let repo3 = Repository(id: 27, name: "rubinius", fullName: "rubinius/rubinius", owner: owner3, description: "The Rubinius Language Platform")

let mockedRepositoryList = [repo1, repo2, repo3]
#endif
