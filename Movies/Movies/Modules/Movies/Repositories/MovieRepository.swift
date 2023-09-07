//
//  MovieRepository.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
    func fetchMovies(page: Int) -> AnyPublisher<ListMovieModel, Error>
    func fetchMovieDetails(by id: Int) -> AnyPublisher<MovieModel, Error>
}

final class MovieRepository {
    
    // MARK: - Properties
    private let network: NetworkProtocol
    
    // MARK: - Init
    init(network: NetworkProtocol) {
        self.network = network
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    func fetchMovies(page: Int) -> AnyPublisher<ListMovieModel, Error> {
        network.request(MoviesRequest.listMovies(page: page).urlRequest(), type: ListMovieModel.self)
    }
    
    func fetchMovieDetails(by id: Int) -> AnyPublisher<MovieModel, Error> {
        network.request(MoviesRequest.movieDetails(id: id).urlRequest(), type: MovieModel.self)
    }
}
