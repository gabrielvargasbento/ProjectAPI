//
//  HaryPotter.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation

struct HarryPotter: Codable, Hashable, Identifiable {
    
    let id: String
    let name: String?
    let house: String?
    let dateOfBirth: String?
    let actor: String?
    let image: String?
}
