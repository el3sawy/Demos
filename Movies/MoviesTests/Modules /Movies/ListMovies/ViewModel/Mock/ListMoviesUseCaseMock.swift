//
//  ListMoviesUseCaseMock.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import Foundation
import Combine
@testable import Movies

final class ListMoviesUseCaseMock {
    
    private var listMovieSubject = PassthroughSubject<[MovieUIModel], Error>()
    
    // MARK: - Simulate Behaviours
    func simulateSuccessListMovie() {
        listMovieSubject.send(MovieStubs.createMovieUIModel())
    }
    
    func simulateFailureListMovie() {
        listMovieSubject.send(completion: .failure(NetworkError.badUrl))
    }
}

extension ListMoviesUseCaseMock: ListMoviesUseCaseProtocol {
    func fetchMovies() -> AnyPublisher<[MovieUIModel], Error> {
        listMovieSubject.eraseToAnyPublisher()
    }
}
