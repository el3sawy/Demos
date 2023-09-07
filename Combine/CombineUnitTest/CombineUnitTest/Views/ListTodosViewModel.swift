//
//  ListTodosViewModel.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 23/02/2023.
//

import Foundation
import Combine

enum State {
    case startLoading
    case endLoading
    case showError(_ message: String)
    case success(data: Codable)
}

protocol ListTodosViewModelOutput {
    var statePublisher: AnyPublisher<State, Never> { get }
}

protocol ListTodosViewModelInput {
    
}

class ListTodosViewModel: ListTodosViewModelOutput {
    
    // MARK: - Properties
    private let repo: AppRepositoryProtocol
    private let stateSubject = PassthroughSubject<State, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - OutPut
    var statePublisher: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Input
    
    // MARK: - Init
    init(repo: AppRepositoryProtocol) {
        self.repo = repo
    }
    
    
    func fetchTodos() {
        stateSubject.send(.startLoading)
        repo.fetchTodos()
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.stateSubject.send(.showError(error.localizedDescription))
                }
                self?.stateSubject.send(.endLoading)
            } receiveValue: { [weak self] todos in
                self?.stateSubject.send(.success(data: todos))
            }
            .store(in: &cancellables)
    }
}
