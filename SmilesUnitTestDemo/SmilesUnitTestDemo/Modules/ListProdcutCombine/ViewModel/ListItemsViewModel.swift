//
//  ListItemsViewModel.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 15/01/2024.
//

import Foundation
import Combine


/// Here in view Model we collect all use case and don;t write any business logic  here just collect them and bind to viewController
 final class ListItemsViewModel {
    
    // MARK: - Properties
    private let useCase: ListItemsUseCaseProtocol
    private var cancelables = Set<AnyCancellable>()
    
    private var stateSubject = PassthroughSubject<State, Never>()
     
    var statePublisher: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Init
    init(useCase: ListItemsUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func loadItems() {
        stateSubject.send(.showLoader)
        
        useCase.fetchItems().sink { [weak self] state in
            guard let self else {
                return
            }
            self.stateSubject.send(.hideLoader) // 1
            
            switch state {
            case .showError(let message):
                self.stateSubject.send(.showError(message: message))
            case .success(let items):
                
                self.stateSubject.send(.success(items: items)) // 2
                
            case .navigateToListProduct:
                self.stateSubject.send(.navigateToListProduct)
            }
        }.store(in: &cancelables)
    }
     
     
     func takeSomeTime(completion: @escaping (Int) -> Void) {
         
         DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//             completion(10)
         }
     }
}

extension ListItemsViewModel {
    enum State: Equatable {
        case showLoader
        case hideLoader
        case showError(message: String)
        case success(items: [ItemModel])
        case navigateToListProduct
        case dismiss
        case showAlert
        // ....Set all cases you want here...........
    }
}
