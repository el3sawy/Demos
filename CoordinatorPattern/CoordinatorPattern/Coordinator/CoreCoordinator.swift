//
//  CoreCoordinator.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

protocol CoreCoordinatorProtocol: AnyObject {
    func logOut()
    func addNewTodo(model: ToDoModel)
    func navigateToAddNewOne()
}

final class CoreCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
   weak var parent: TabBarCoordinator?
    var coordinatorDidFinish: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        viewController.tabBarItem = UITabBarItem(title: "Green", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        setRootViewController(viewController)
    }
}


extension CoreCoordinator: CoreCoordinatorProtocol {
    func logOut() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
    
    func addNewTodo(model: ToDoModel) {
        if let home = firstViewController as? HomeViewController {
            home.addNewToDo(model: model)
        }
        popViewController(animated: true)
    }
    
    func navigateToAddNewOne() {
        if LocalStorage.shared.isLogin {
            let vc = AddToDoViewController(coordinator: self)
            push(vc, animated: true)
        } else {
            let nav = UINavigationController()
            let corr = AuthCoordinator(navigationController: nav)
            corr.coordinatorDidFinish = { [weak self] in
                guard let self else {
                    return
                }
                nav.dismiss(animated: true)
//                self?.children.removeAll(where: { $0 is AuthCoordinator })
                
                self.removeChild(AuthCoordinator.self)
//                for (index, coordinator) in self.children.enumerated() {
//                    if coordinator === corr {
//                        self.children.remove(at: index)
//                        break
//                    }
//                }
                
//                self.navigateToAddNewOne()
            }
            corr.start()
           addChild(corr)
            navigationController.present(nav, animated: true)
        }
    }
}
