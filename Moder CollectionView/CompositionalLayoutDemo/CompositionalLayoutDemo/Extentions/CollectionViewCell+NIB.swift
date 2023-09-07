//
//  CollectionViewCell+NIB.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 01/11/2022.
//

import UIKit

extension UICollectionViewCell {
    static var className: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
}
