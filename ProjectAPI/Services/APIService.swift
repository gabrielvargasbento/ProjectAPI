//
//  APIService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 14/12/23.
//

import Foundation
import CwlCatchException

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
    
    /**
     Fetches data array from the specified URL.

     - Parameters:
        - url: The URL from which to fetch the data array.
        - completion: A closure to be called when the fetch operation completes. It takes an optional array of the associated type `T` and an optional `Error` as parameters.
        - Parameter data: The fetched data array, if successful, otherwise nil.
        - Parameter error: An error that occurred during the fetch operation, otherwise nil.
     */
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
    
    /**
     Fetches unique data from the specified URL.

     - Parameters:
        - url: The URL from which to fetch the data.
        - completion: A closure to be called when the fetch operation completes. It takes an optional associated type `T` and an optional `Error` as parameters.
        - Parameter data: The fetched data, if successful, otherwise nil.
        - Parameter error: An error that occurred during the fetch operation, otherwise nil.
     */
    func fetchDataItem(from url: URL, completion: @escaping (T?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil, error)
            } else if let data = data {
                
                // Try to decode as an struct
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        self.apiItem = decodedData
                        completion(decodedData, nil)
                    }
                } catch {
                    
                    // Try to decode as an array with an unique struct on it.
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
