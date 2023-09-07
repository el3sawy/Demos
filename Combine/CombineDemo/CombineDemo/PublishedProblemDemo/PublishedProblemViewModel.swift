//
//  PublishedProblemViewModel.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 18/01/2023.
//

import Foundation
import Combine

typealias AppBag = Set<AnyCancellable>
class PublishedProblemViewModel {
    
//    @Published var todos: [TodoModel] = []
    
    var todos = CurrentValueSubject<[TodoModel], Never>([])
    private var bag = AppBag()
    
    func load() {
        fetchTodos().sink { completion in
            print(completion)
        } receiveValue: { [weak self] values in
            print(values)
//            self?.todos = []
            self?.todos.send(values)
        }.store(in: &bag)
    }
    
    
//    func load2() {
//        fetchTodos().assign(to: &$todos1)
//    }
    
   private func fetchTodos() -> AnyPublisher<[TodoModel], Never> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [TodoModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
