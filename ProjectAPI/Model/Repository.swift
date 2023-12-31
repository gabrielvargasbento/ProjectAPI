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
    let nodeId: String?
    let avatarUrl: String?
    let htmlUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}
