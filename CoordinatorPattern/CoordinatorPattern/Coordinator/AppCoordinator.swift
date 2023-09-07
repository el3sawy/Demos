//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 19/06/2023.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Proprites
    private let window: UIWindow?
    var children: [Coordinator] = []
    
    /// Initializes a new `AppCoordinator`  object with the specified window.
    /// - Parameter window: The window used for displaying the app's user interface.
    init(window: UIWindow?) {
        self.window = window
    }
    
    /// Starts the navigation flow managed by the coordinator.
    func start() {
        if LocalStorage.shared.isLogin {
            displayLoggedInFlow()
        } else {
            displayOnboardingFlow()
        }
    }
}

// MARK: - Flows Helpers
extension AppCoordinator {
    func displayOnboardingFlow() {
        let navigationController = UINavigationController()
        let coordinator = AuthCoordinator(navigationController: navigationController)
        coordinator.finishDelegate = self
        coordinator.start()
        coordinator.parentOfParent = self
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }
    
    func displayLoggedInFlow() {
        let navigationController = UINavigationController()
        let coordinator = TabBarCoordinator(navigationController: navigationController)
        coordinator.parent = self
        coordinator.start()
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }
    
    func clean() {
        children.removeAll()
    }
    
    func logout() {
        LocalStorage.shared.setLogin(value: false)
        clean()
        start()
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        clean()
        start()
    }
}

// MARK: - Window Replacement
private extension AppCoordinator {
    ///  Replaces the root view controller of the app's window.
    ///
    /// This method sets the specified view controller as the root view controller of the app's window,
    /// and makes the window visible.
    func replaceRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
