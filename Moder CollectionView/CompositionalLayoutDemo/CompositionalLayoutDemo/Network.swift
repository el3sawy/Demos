//
//  File.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func request<T: Codable>(_ url: URLEnum, type: T.Type) -> AnyPublisher<T, Error>
}

final public class Network {
    
    // MARK: - Properties
    private let session: URLSession
    
    // MARK: - Init
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

// MARK: - Extension
extension Network: NetworkProtocol {
    func request<T: Codable>(_ url: URLEnum, type: T.Type) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: url.url)
            .map(\.data)
            .decode(type: type.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
