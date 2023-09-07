//
//  Network.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 23/02/2023.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func request<T: Codable>(_ url: String, type: T.Type) -> AnyPublisher<T, Error>
}

class Network: NetworkProtocol {
    func request<T: Codable>(_ url: String, type: T.Type) -> AnyPublisher<T, Error> {
       let url = URL(string: url)!
       return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
