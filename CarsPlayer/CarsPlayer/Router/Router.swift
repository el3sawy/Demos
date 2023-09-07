//
//  Router.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 28/07/2022.
//

import Foundation
import UIKit

enum NavigationStyle {
    case push(animated: Bool)
    case presentModally(presentationStyle: UIModalPresentationStyle, animated: Bool, completion: (() -> Void)?)
}

protocol RouterProtocol {
    var navigationStyle: NavigationStyle { get }
    var destinationViewController: UIViewController { get }
}
