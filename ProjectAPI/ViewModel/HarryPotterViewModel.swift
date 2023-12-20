//
//  HarryPotterViewModel.swift
//  ProjectAPI
//
//  Created by dti Digital on 14/12/23.
//

import Foundation
import SwiftUI

class HarryPotterViewModel: ObservableObject {
    
    @Published var apiService = APIService<HarryPotter>()
    @Published var harryPotterList: [HarryPotter] = []
    
    func fetchHarryPotter() {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            print("Invalid URL")
            return
        }
        harryPotterList = apiService.fetchData(from: url)
    }
}
