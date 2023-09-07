//
//  SyncApisViewModel.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 04/02/2023.
//

import Foundation
import Combine

enum SyncApis {
    case didLoadTodo(values: [TodoModel])
    case didLoadProdcust(values: [ProductModel])
}

class SyncApisViewModel {
    private (set) var loadingState = PassthroughSubject<State, Never>()
    private (set) var dataState = PassthroughSubject<SyncApis, Never>()
    private var cancellations = Set<AnyCancellable>()
   
    init() {
        fetchAll()
    }
    
    func fetchAll() {
        fetchTodos()
            .flatMap { values -> AnyPublisher<[ProductModel], Error>  in
                self.dataState.send(.didLoadTodo(values: values))
                return self.fetchProducts()
            }
            .delay(for: 2, scheduler: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { products in
                self.dataState.send(.didLoadProdcust(values: products))
            }.store(in: &cancellations)
    }
    
    private func fetchTodos() -> AnyPublisher<[TodoModel], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/")!
        return ApiClient.make(.init(url: url)).eraseToAnyPublisher()
    }
    
    private func fetchProducts() -> AnyPublisher<[ProductModel], Error> {
        let url = URL(string: "https://dummyjson.com/products")!
        let publisher: AnyPublisher<ProductDataModel, Error> = ApiClient.make(.init(url: url))
        return publisher.map(\.products)
            .compactMap({ $0 })
            .eraseToAnyPublisher()
    }
}
