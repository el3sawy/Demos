//
//  RootRouter.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

enum RootRouter: RouterProtocol {
    
    // MARK: - Cases
    case root
    
    // MARK: - Properties
    var navigationStyle: NavigationStyle {
        switch self {
        case .root:
            return .push(animated: true)
        }
    }
    
    var destinationViewController: UIViewController {
        switch self {
        case .root:
            return MovieConfigurator.getViewController(with: .listMovies)
        }
    }
}
