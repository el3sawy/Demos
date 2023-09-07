//
//  MovieConfigurator.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import Foundation
import UIKit

enum MovieConfiguratorType {
    case listMovies
    case movieDetails(id: Int)
}

enum MovieConfigurator {
    
    static func getViewController(with type: MovieConfiguratorType) -> UIViewController {
        switch type {
            
        case .listMovies:
            return configListMoviesViewController()
        
        case .movieDetails(id: let id):
            return configMovieDetailsViewController(movieId: id)
        }
    }
    
    private static func configListMoviesViewController() -> UIViewController {
        let network = Network.shared
        let repository = MovieRepository(network: network)
        let useCase = ListMoviesUseCase(repository: repository)
        let viewModel = ListMoviesViewModel(useCase: useCase)
        let view = ListMoviesViewController(viewModel: viewModel)
        return view
    }
    
    private static func configMovieDetailsViewController(movieId: Int) -> UIViewController {
        let network = Network.shared
        let repository = MovieRepository(network: network)
        let viewModel = MovieDetailsViewModel(repository: repository, movieId: movieId)
        let view = MovieDetailsViewController(viewModel: viewModel)
        return view
    }
}
