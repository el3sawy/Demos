//
//  MoviesCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

protocol MoviesCoordinatorProtocol: AnyObject {
    
}

final class MoviesCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var children: [Coordinator] = []
    weak  var parent: TabBarCoordinator?
    var coordinatorDidFinish: (() -> Void)?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ListMoviesViewController(coordinator: self)
        vc.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "appletv.fill"), selectedImage: nil)
        setRootViewController(vc)
    }
}

extension MoviesCoordinator: MoviesCoordinatorProtocol {
    
}
