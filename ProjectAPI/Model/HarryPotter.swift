//
//  HaryPotter.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation
import CwlCatchException

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

#if UITEST
let mockedHarryPotterList: [HarryPotter] = [
    HarryPotter(id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
                name: "Harry Potter",
                house: "Gryffindor",
                dateOfBirth: "31-07-1980",
                actor: "Daniel Radcliffe",
                image: "https://ik.imagekit.io/hpapi/harry.jpg"),
    
    HarryPotter(id: "4c7e6819-a91a-45b2-a454-f931e4a7cce3",
                name: "Hermione Granger",
                house: "Gryffindor",
                dateOfBirth: "19-09-1979",
                actor: "Emma Watson",
                image: "https://ik.imagekit.io/hpapi/hermione.jpeg"),
    
    HarryPotter(id: "c3b1f9a5-b87b-48bf-b00d-95b093ea6390",
                name: "Ron Weasley",
                house: "Gryffindor",
                dateOfBirth: "01-03-1980",
                actor: "Rupert Grint",
                image: "https://ik.imagekit.io/hpapi/ron.jpg")
]
#endif
