//
//  ListMoviesUseCase.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
import Combine

protocol ListMoviesUseCaseProtocol {
    func fetchMovies() -> AnyPublisher<[MovieUIModel], Error>
}

class ListMoviesUseCase {
    
    // MARK: - Properties
    private let repository: MovieRepositoryProtocol
    private var currentPage = 1
    private var totalPages = 1
    private var isLoading = false
    
    // MARK: - Init
    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
}

extension ListMoviesUseCase: ListMoviesUseCaseProtocol {
    
    func fetchMovies() -> AnyPublisher<[MovieUIModel], Error> {
        
        guard currentPage <= totalPages, isLoading == false else {
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        isLoading = true
        return repository.fetchMovies(page: currentPage)
            .map(map)
            .eraseToAnyPublisher()
    }
    
    private func map(_ result: ListMovieModel) -> [MovieUIModel] {
        totalPages = result.totalPages ?? 0
        currentPage += 1
        isLoading = false
        let movies = result.results ?? []
        return movies.map {
            MovieUIModel(movieId: $0.id,
                         imageURL: $0.posterPath,
                         name: $0.originalTitle,
                         releaseYear: $0.releaseDate
            )
        }
    }
}
