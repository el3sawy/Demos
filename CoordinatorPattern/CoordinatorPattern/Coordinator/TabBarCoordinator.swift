//
//  TabBarCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 21/06/2023.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    unowned var parent: AppCoordinator?
    var coordinatorDidFinish: (() -> Void)?
    var children: [Coordinator] = []
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tab = BaseTabBarController(coordinator: self)
        setRootViewController(tab)
    }
    
    func logout() {
        parent?.logout()
        children.removeAll()
    }
}
