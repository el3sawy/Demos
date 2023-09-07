//
//  AppRepository.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 23/02/2023.
//

import Foundation
import Combine

protocol AppRepositoryProtocol {
    func fetchTodos() -> AnyPublisher<[TodoModel], Error>
}

class AppRepository: AppRepositoryProtocol {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchTodos() -> AnyPublisher<[TodoModel], Error> {
        network.request("https://jsonplaceholder.typicode.com/todos", type: [TodoModel].self)
    }
}
