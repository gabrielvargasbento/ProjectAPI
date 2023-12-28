//
//  HaryPotter.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation

protocol HarryPotterItem {
    var id: String { get }
    var name: String? { get }
    var house: String? { get }
    var dateOfBirth: String? { get }
    var actor: String? { get }
    var image: String? { get }
}

struct HarryPotter: Codable, Hashable, Identifiable, HarryPotterItem {
    let id: String
    let name: String?
    let house: String?
    let dateOfBirth: String?
    let actor: String?
    let image: String?
}
