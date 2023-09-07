//
//  MoviesRouter.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

protocol MoviesRouterProtocol: Router {
    func pushMovieDetails(with id: Int)
}

enum MoviesRouter: RouterProtocol {
    
    // MARK: - Cases
    case list
    case details(id: Int)
    
    // MARK: - Properties
    var navigationStyle: NavigationStyle {
        switch self {
        case .list, .details:
            return .push(animated: true)
        }
    }
    
    var destinationViewController: UIViewController {
        switch self {
        case .list:
            return MovieConfigurator.getViewController(with: .listMovies)
        case .details(let id):
            return MovieConfigurator.getViewController(with: .movieDetails(id: id))
        }
    }
}
