//
//  Pushable.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation
import UIKit

protocol Pushable {
    func push(_ viewController: UIViewController)
}

extension Pushable where Self: UIViewController {
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
