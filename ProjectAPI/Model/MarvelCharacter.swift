//
//  MarvelCharacter.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 15/02/24.
//

import Foundation
import CwlCatchException

struct CharacterDataWrapperMarvel: Decodable {
    let data: DataMarvel
}

struct DataMarvel: Decodable {
    let results: [MarvelCharacter]
}

struct MarvelCharacter: Identifiable, Decodable, Equatable {
    
    static func == (lhs: MarvelCharacter, rhs: MarvelCharacter) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    let id: Int
    let name: String?
    let description: String?
    let comics: Comics?
}

struct Comics: Decodable {
    let available: Int?
    let items: [Item]?
}

struct Item: Decodable {
    let name: String?
}
