//
//  View+Constrains.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

extension UIView {
    
    @discardableResult
    func centerX(anchor: NSLayoutXAxisAnchor, distance: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let const = centerXAnchor.constraint(equalTo: anchor, constant: distance)
        const.isActive = true
        return const
    }
    
    @discardableResult
    func centerY(anchor: NSLayoutYAxisAnchor, distance: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let const = centerYAnchor.constraint(equalTo: anchor, constant: distance)
        const.isActive = true
        return const
    }
    
    @discardableResult
    func heightSize(size: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let const = heightAnchor.constraint(equalToConstant: size)
        const.isActive = true
        return const
    }
    
    @discardableResult
    func widthSize(size: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let const = widthAnchor.constraint(equalToConstant: size)
        const.isActive = true
        return const
    }
}
