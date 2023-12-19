//
//  APIService.swift
//  ProjectAPI
//
//  Created by dti Digital on 14/12/23.
//

import Foundation
import FirebaseAnalytics

class APIService<T: Decodable>: ObservableObject, RandomAccessCollection {
    
    @Published var apiList: [T] = []

    // Conformidade ao protocolo RandomAccessCollection
    var startIndex: Int { apiList.startIndex }
    var endIndex: Int { apiList.endIndex }

    func index(after i: Int) -> Int {
        return apiList.index(after: i)
    }

    subscript(position: Int) -> T {
        return apiList[position]
    }
        
    func fetchData(from url: URL) -> [T] {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                    DispatchQueue.main.async {
                        self.apiList = decodedData
                    }
                } catch {
                    print("Erro ao decodificar dados: \(error)")
                }
            }
        }.resume()
        
        return self.apiList
    }
    
    func analytics (nome: String, classe: String) {
        
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: nome,
                                       AnalyticsParameterScreenClass: classe])
    }
    
}

// renomear
// novo arquivo
// ga_event_origin (_o) = app; -> renomear parametros

// crash
// clique dos botoes
