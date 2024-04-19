//
//  ListItemsUseCaseMock.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 16/01/2024.
//

import Foundation
import Combine
@testable import SmilesUnitTestDemo

final class ListItemsUseCaseMock: ListItemsUseCaseProtocol {
    
    var fetchItemsResponse: Result<ListItemsUseCase.State, Never> = .success(.navigateToListProduct)
    
    func fetchItems() -> AnyPublisher<ListItemsUseCase.State, Never> {
        Future<ListItemsUseCase.State, Never> { promise in
            promise(self.fetchItemsResponse)
        }.eraseToAnyPublisher()
    }
}
