//
//  MovieRepositoryMock.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
import Combine
@testable import Movies

class MovieRepositoryMock {
    
    // MARK: - Properties
    private var listMovieSubject = PassthroughSubject<ListMovieModel, Error>()
    private var movieDetailsSubject = PassthroughSubject<MovieModel, Error>()
    
    // MARK: - Simulate Behaviours
    func simulateSuccessListMovie() {
        listMovieSubject.send(MovieStubs.createMovieModel())
    }
    
    func simulateFailureListMovie() {
        listMovieSubject.send(completion: .failure(NetworkError.badUrl))
    }
    
    func simulateSuccessDetailsMovie() {
        movieDetailsSubject.send(MovieStubs.createMovieDetailsModel())
    }
    
    func simulateFailureDetailsMovie() {
        movieDetailsSubject.send(completion: .failure(NetworkError.badUrl))
    }
}

extension MovieRepositoryMock: MovieRepositoryProtocol {
    func fetchMovieDetails(by id: Int) -> AnyPublisher<MovieModel, Error> {
        movieDetailsSubject.eraseToAnyPublisher()
    }
    
    func fetchMovies(page: Int) -> AnyPublisher<ListMovieModel, Error> {
        listMovieSubject.eraseToAnyPublisher()
    }
}
