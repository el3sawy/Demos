//
//  Router.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

protocol Router {
    var sourceViewController: UIViewController? {get set}
    func pushViewController(_ viewController: UIViewController)
}

extension Router {
    func pushViewController(_ viewController: UIViewController) {
        sourceViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
