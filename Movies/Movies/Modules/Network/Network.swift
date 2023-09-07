//
//  Network.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func request<T: Codable>(_ url: URL, type: T.Type) -> AnyPublisher<T, Error>
}

final class Network {
    
    // MARK: - Properties
    static let shared = Network(urlSession: URLSession.shared)
    private let urlSession: URLSession
    
    // MARK: - Init
     init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

extension Network: NetworkProtocol {
    func request<T: Codable>(_ url: URL, type: T.Type) -> AnyPublisher<T, Error> {
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
