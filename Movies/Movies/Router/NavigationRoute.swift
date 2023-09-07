//
//  NavigationRoute.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

protocol NavigationRoute {
    func navigate(to router: RouterProtocol)
}

extension NavigationRoute where Self: UIViewController {
    func navigate(to router: RouterProtocol) {
        switch router.navigationStyle {
        case .push(let animated):
            navigationController?.pushViewController(router.destinationViewController, animated: animated)
        }
    }
}
