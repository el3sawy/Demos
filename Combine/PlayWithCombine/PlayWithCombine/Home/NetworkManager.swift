//
//  NetworkManager.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 22/08/2022.
//

import Combine
import Foundation

enum CustomError: Error {
    case invalidURL
    case responseError
    
    var name: String {
        switch self {
        case .invalidURL:
            return " invalidURL"
        case .responseError:
            return " Server error"
        }
        
    }
}
class NetworkManager {
    static func request<T: Codable>(_ url: URL) -> AnyPublisher<T, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {
                let decoder = JSONDecoder()
                print("request")
                return try decoder.decode(T.self, from: $0.data)
            }
            .eraseToAnyPublisher()
    }
    
    static func request<T: Codable>(_ url: URL, type: T.Type) -> AnyPublisher<T, Error> {
        print("request")
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func requestFuture<T: Codable>(_ url: URL) -> Future<T, Error> {
       return Future { promise in
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let _error = error as? URLError {
                    promise(.failure(_error))
                } else {
                    let decoder = JSONDecoder()
                    let model = try! decoder.decode(T.self, from: data!)
                    promise(.success(model))
                }
                print("RECEIVED RESPONSE")
            }.resume()
        }
    }
    
    static func defaultPublisher() -> AnyPublisher<Int, Never> {
        let value = Int.random(in: 0...100)
        print("defaultPublisher")
        return [value].publisher.eraseToAnyPublisher()
    }
}
