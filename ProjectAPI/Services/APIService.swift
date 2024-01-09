//
//  APIService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation

class APIService<T: Decodable>: ObservableObject, RandomAccessCollection {
    
    @Published var apiList: [T] = []
    @Published var apiItem: T? = nil
    
    // Conformidade ao protocolo RandomAccessCollection
    var startIndex: Int { apiList.startIndex }
    var endIndex: Int { apiList.endIndex }
    
    func index(after i: Int) -> Int {
        return apiList.index(after: i)
    }
    
    subscript(position: Int) -> T {
        return apiList[position]
    }
    
    // Recuperar dados de uma API, retornando um array generico com escaping
    func fetchData(from url: URL, completion: @escaping ([T]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                    DispatchQueue.main.async {
                        self.apiList = decodedData
                        completion(decodedData)
                    }
                } catch {
                    print("Erro ao decodificar dados: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func fetchDataItem(from url: URL, completion: @escaping (Result<T?, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(.failure(error))
            } else if let data = data {
                
                // Tentar decodificar uma struct
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                } catch {
                    
                    // Tentar decodififcar um array com uma unica struct contida nele
                    do {
                        let decodedData = try JSONDecoder().decode([T].self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(decodedData[0]))
                        }
                    } catch {
                        
                        print("Erro ao decodificar dados: \(error)")
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
}

// switch
