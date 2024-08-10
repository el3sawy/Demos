//
//  ReuseIdentifierProtocol.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView {}

extension UICollectionReusableView: ReusableView {}

extension UITableViewHeaderFooterView: ReusableView {}
