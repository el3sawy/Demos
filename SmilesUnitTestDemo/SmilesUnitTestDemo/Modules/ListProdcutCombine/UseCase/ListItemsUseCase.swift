//
//  ListItemsUseCase.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 15/01/2024.
//

import Foundation
import Combine

protocol ListItemsUseCaseProtocol {
    func fetchItems() -> AnyPublisher<ListItemsUseCase.State, Never>
}

final class ListItemsUseCase: ListItemsUseCaseProtocol {
    
    // MARK: - Properties
    private let network: NetworkProtocol // Abstraction
    private var cancelables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchItems() -> AnyPublisher<State, Never> {
        
        Future<State, Never> { [weak self] promise in
            guard let self else {
                return
            }
            self.network
                .request()
                .sink { completion in
                    if case .failure(let error) = completion {
                        promise(.success(.showError(message: error.localizedDescription)))
                    }
                } receiveValue: { items in
                    promise(.success(.success(items: items)))
                }
                .store(in: &cancelables)
        }
        .eraseToAnyPublisher()
    }
}

extension ListItemsUseCase {
    /// I'm really love this scenario
    /// You set all states you will use it in the UseCase and will be more readable for anyone want edit it in the future
    enum State: Equatable {
        case showError(message: String)
        case success(items: [ItemModel])
        case navigateToListProduct
    }
}
