//
//  UITableView+XIB.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
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
