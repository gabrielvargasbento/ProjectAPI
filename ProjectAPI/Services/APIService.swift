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
                
                // Tentar decodificar uma struct ou um array com uma única struct contida nele
                if let dataType = T.self as? Decodable.Type {
                    do {
                        let decodedData = try JSONDecoder().decode(dataType, from: data)
                        
                        if let decodedItem = decodedData as? T {
                            DispatchQueue.main.async {
                                completion(decodedItem, nil)
                            }
                        } else if let decodedArray = decodedData as? [T], let decodedItem = decodedArray.first {
                            DispatchQueue.main.async {
                                completion(decodedItem, nil)
                            }
                        } else {
                            print("Erro ao decodificar dado: Tipo incompatível")
                            completion(nil, error)
                        }
                    } catch {
                        print("Erro ao decodificar dado: \(error)")
                        completion(nil, error)
                    }
                } else {
                    print("Erro ao decodificar dados: Tipo não Decodable")
                    completion(nil, error)
                }


            }
        }.resume()
    }
}
