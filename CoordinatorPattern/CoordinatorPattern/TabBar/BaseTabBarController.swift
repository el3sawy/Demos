//
//  BaseTabBarController.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    private let coreCoordinator = CoreCoordinator(navigationController: UINavigationController())
    private let moviesCoordinator = MoviesCoordinator(navigationController: UINavigationController())
    private let wishListCoordinator = WishListCoordinator(navigationController: UINavigationController())
    private let settingCoordinator = SettingCoordinator(navigationController: UINavigationController())
    
    weak var coordinator: TabBarCoordinator?
    
    init(coordinator: TabBarCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: "BaseTabBarController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        coreCoordinator.parent = coordinator
        moviesCoordinator.parent = coordinator
        wishListCoordinator.parent = coordinator
        settingCoordinator.parent = coordinator
        let coords: [Coordinator] =  [coreCoordinator, moviesCoordinator, wishListCoordinator, settingCoordinator]
        
        coordinator?.children.append(contentsOf: coords)
        
        coreCoordinator.start()
        moviesCoordinator.start()
        wishListCoordinator.start()
        settingCoordinator.start()
        
        viewControllers =  [coreCoordinator.navigationController,
                            moviesCoordinator.navigationController,
                            wishListCoordinator.navigationController,
                            settingCoordinator.navigationController]
        
    }
}
