//
//  APIService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation

protocol APIServiceProtocol {
    associatedtype T: Decodable
    func fetchData(from url: URL, completion: @escaping ([T]?, Error?) -> ())
}

class APIService<T: Decodable>: ObservableObject, RandomAccessCollection, APIServiceProtocol {
    
    @Published var apiList: [T] = []
    @Published var apiItem: T? = nil
    
    var startIndex: Int { apiList.startIndex }
    var endIndex: Int { apiList.endIndex }
    
    func index(after i: Int) -> Int {
        return apiList.index(after: i)
    }
    
    subscript(position: Int) -> T {
        return apiList[position]
    }
    
    // Recuperar dados de uma API, retornando um array generico ou erro
    func fetchData(from url: URL, completion: @escaping ([T]?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil, error)
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                    DispatchQueue.main.async {
                        self.apiList = decodedData
                        completion(decodedData, nil)
                    }
                } catch {
                    print("Erro ao decodificar dados: \(error)")
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    func fetchDataItem(from url: URL, completion: @escaping (T?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil, error)
            } else if let data = data {
                
                // Tentar decodificar uma struct
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        self.apiItem = decodedData
                        completion(decodedData, nil)
                    }
                } catch {
                    
                    // Tentar decodififcar um array com uma unica struct contida nele
                    do {
                        let decodedData = try JSONDecoder().decode([T].self, from: data)
                        
                        print("decodedData: \(decodedData)")

                        if let firstElement = decodedData.first {
                            DispatchQueue.main.async {
                                self.apiItem = firstElement
                                completion(firstElement, nil)
                            }
                        } else {
                            let error = NSError(domain: "Project API", code: 1001, userInfo: [NSLocalizedDescriptionKey: "O JSON está vazio"])
                            DispatchQueue.main.async {
                                completion(nil, error)
                            }
                        }
                    } catch {
                        print("Erro ao decodificar dados: \(error)")
                        completion(nil, error)
                    }
                }
            }
        }.resume()
    }
}
