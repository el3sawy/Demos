//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    /// The navigation controller for the coordinator
    var navigationController: UINavigationController { get set }
    
    var children: [Coordinator] { get set }
    /**
     The Coordinator takes control and activates itself.
     */
    func start()
    var coordinatorDidFinish: (() -> Void)? { get set }
}

extension Coordinator {
    /**
     Pops out the active View Controller from the navigation stack.
     - Parameters:
     - animated: Set this value to true to animate the transition.
     */
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        navigationController.popToViewController(ofClass: ofClass, animated: animated)
    }
    
    func setRootViewController(_ viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    var firstViewController: UIViewController {
        navigationController.viewControllers.first ?? UIViewController()
    }
    
    func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
    
    /**
     Adds the given coordinator to the list of children.
     - Parameters:
        - child: A coordinator.
     */
    func addChild(_ child: Coordinator?){
        if let _child = child {
            children.append(_child)
        }
    }
    
    func removeChild<T: Coordinator>(_ child: T.Type) {
        children.removeAll(where: { $0 is T })
    }
}

/// Delegate protocol helping parent Coordinator know when its child is ready to be finished.
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
