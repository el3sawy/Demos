//
//  NavigationStyle.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

enum NavigationStyle {
    case push(animated: Bool)
}

protocol RouterProtocol {
    var navigationStyle: NavigationStyle { get }
    var destinationViewController: UIViewController { get }
}
