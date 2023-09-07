//
//  RetryViewModel.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 31/01/2023.
//

import Foundation
import Combine

class RetryViewModel {
    
    var statePublisher: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    private var stateSubject = PassthroughSubject<State, Never>()
    private var cancels = Set<AnyCancellable>()
    
    init() {
       
    }
    
     func loadTodos() {
        stateSubject.send(.showLoader)
         let correctURL = "https://jsonplaceholder.typicode.com/todos/"
         let wrongURL = "https://jsonplaceholder..com/todos/"
        let url = URLRequest(url: URL(string: wrongURL)!)
        let publisher: AnyPublisher<[TodoModel], Error> = ApiClient.make(url)
        publisher
             .print("(1)>")
//             .delay(for: 1, scheduler: DispatchQueue.global())
             .retry(3)
             .print("(2)>")
             .sink { [weak self] completion in
            self?.stateSubject.send(.hideLoader)
            switch completion {
                
            case .finished:
                print("finished")
            case .failure(let error):
                self?.stateSubject.send(.showError(message: error.localizedDescription))
            }
        } receiveValue: { values in
            print(values)
        }.store(in: &cancels)
         
    }
}

// It's time to play
extension RetryViewModel {
    
}
