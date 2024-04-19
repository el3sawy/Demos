//
//  Network.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 15/01/2024.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func request() -> AnyPublisher<[ItemModel], NetworkError>
}

final class Network: NetworkProtocol {
    
    // Call API
    func request() -> AnyPublisher<[ItemModel], NetworkError> {
        return Result<[ItemModel], NetworkError>.Publisher([
            ItemModel(id: 1, name: "Ahmed"),
            ItemModel(id: 2, name: "Naguib"),
            ItemModel(id: 3, name: "Mohamed"),
            ItemModel(id: 4, name: "Smiles"),
            ItemModel(id: 5, name: "Etisalat")
        ])
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
