//
//  AuthCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 19/06/2023.
//

import UIKit

protocol AuthCoordinatorProtocol: AnyObject {
    func didTapLogin()
    /// Called when the user successfully logs in.
    func didFinishSignIn()
    func skipLogin()
}

// MARK: - AuthCoordinator
final class AuthCoordinator: Coordinator {
    // MARK: - Proprites
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    weak var parentOfParent: AppCoordinator?
    weak var parent: TabBarCoordinator?
    var children: [Coordinator] = []
    var coordinatorDidFinish: (() -> Void)?
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Starts the navigation flow managed by the Auth coordinator.
    func start() {
        let viewModel = OnboardingViewModel(coordinator: self)
        let viewController = OnboardingViewController(viewModel: viewModel)
        setRootViewController(viewController)
    }
}

// MARK: - AuthCoordinatorProtocol Conformance
extension AuthCoordinator: AuthCoordinatorProtocol {
    func didTapLogin() {
        let viewModel = LoginViewModel(coordinator: self)
        let viewController = LoginViewController(viewModel: viewModel)
        push(viewController, animated: true)
    }
    
    func didFinishSignIn() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        coordinatorDidFinish?()
    }
    
    func skipLogin() {
        parentOfParent?.clean()
        parentOfParent?.displayLoggedInFlow()
    }
}
