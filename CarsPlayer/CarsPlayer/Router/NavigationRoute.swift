//
//  NavigationRoute.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 28/07/2022.
//

import Foundation

import Foundation
import UIKit

protocol NavigationRoute: AnyObject {
    func navigate(to router: RouterProtocol)
}

extension NavigationRoute where Self: UIViewController {
    func navigate(to router: RouterProtocol) {
        switch router.navigationStyle {
        case .push(let animated):
            navigationController?.pushViewController(router.destinationViewController, animated: animated)
        case .presentModally(let presentationStyle, let animated, let completion):
            let presentedViewController = router.destinationViewController
            presentedViewController.modalPresentationStyle = presentationStyle
            present(presentedViewController, animated: animated, completion: completion)
        }
    }
}
