//
//  NibLoadableView.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import UIKit

protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: NibLoadableView { }

extension UICollectionReusableView: NibLoadableView { }

extension UITableViewHeaderFooterView: NibLoadableView {}
