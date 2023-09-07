//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import Foundation
import Combine

class MovieDetailsViewModel {
    
    // MARK: - Properties
    private let repository: MovieRepositoryProtocol
    private let movieId: Int
    private var cancellables = AppBag()
    @Published private(set) var showLoader = false
    @Published private(set) var errorMessage = ""
    @Published private(set) var movieUIModel: MovieUIModel = .init()
    
    // MARK: - Init
    init(repository: MovieRepositoryProtocol, movieId: Int) {
        self.repository = repository
        self.movieId = movieId
        fetchDetails()
    }
    
    func fetchDetails() {
        showLoader = true
        repository.fetchMovieDetails(by: movieId).sink(receiveCompletion: { [weak self] completion in
            if case .failure(let error) = completion {
                self?.errorMessage = error.localizedDescription
            }
            self?.showLoader = false
        }, receiveValue: map)
            .store(in: &cancellables)
    }
    
    private func map(_ movie: MovieModel) {
        movieUIModel = MovieUIModel(
            imageURL: movie.posterPath,
            name: movie.originalTitle,
            releaseYear: movie.releaseDate,
            overView: movie.overview
        )
    }
}
