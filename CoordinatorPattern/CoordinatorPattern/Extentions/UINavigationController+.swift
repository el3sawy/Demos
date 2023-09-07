//
//  UINavigationController+.swift
//  CoordinatorPattern
//
//  Created by NTG on 18/06/2023.
//

import UIKit

public extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
}
