//
//  WishListCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

protocol WishListCoordinatorProcol: AnyObject {
    
}

final class WishListCoordinator: Coordinator {
    var navigationController: UINavigationController
    weak var parent: TabBarCoordinator?
    var children: [Coordinator] = []
    var coordinatorDidFinish: (() -> Void)?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = WishListViewController(Coordinator: self)
        vc.tabBarItem = UITabBarItem(title: "WishList", image: UIImage(systemName: "heart.fill"), selectedImage: nil)
        setRootViewController(vc)
    }
}

extension WishListCoordinator: WishListCoordinatorProcol {
    
}
