//
//  SettingCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

protocol SettingCoordinatorProtocol: AnyObject {
    func login()
}

final class SettingCoordinator: Coordinator {
     var navigationController: UINavigationController
    weak var parent: TabBarCoordinator?
    var children: [Coordinator] = []
    var coordinatorDidFinish: (() -> Void)?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SettingViewController(coordinator: self)
        vc.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "12.circle.fill"), selectedImage: nil)
        setRootViewController(vc)
    }
}


extension SettingCoordinator: SettingCoordinatorProtocol {
    func login() {
        if LocalStorage.shared.isLogin {
            parent?.logout()
        } else {
            let nav = UINavigationController()
            let coordinator = AuthCoordinator(navigationController: nav)
            coordinator.coordinatorDidFinish = { [weak self] in
                nav.dismiss(animated: true)
                self?.removeChild(AuthCoordinator.self)
            }
            coordinator.start()
            navigationController.present(nav, animated: true)
            children.append(coordinator)
        }
    }
}
