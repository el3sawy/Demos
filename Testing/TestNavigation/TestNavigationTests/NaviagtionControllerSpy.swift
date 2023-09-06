//
//  NaviagtionControllerSpy.swift
//  TestNavigationTests
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import UIKit

class NavigationControllerSpy: UINavigationController {
 
    var pushedViewController: UIViewController!
    var isCalledPop = 0
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        isCalledPop += 1
        return UIViewController()
    }
}
