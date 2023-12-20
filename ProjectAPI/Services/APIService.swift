//
//  APIService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation

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
    
    // Recuperar dados de uma API, retornando um array generico
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
}

// novo arquivo                                           OK
// ga_event_origin (_o) = app; -> renomear parametros     OK
// crash                                                  OK
// clique dos botoes
