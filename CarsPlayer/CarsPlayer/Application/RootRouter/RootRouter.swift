//
//  RootRouter.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 27/07/2022.
//

import UIKit

enum RootRouter: RouterProtocol {
    
    // MARK: - Cases
    case root
    
    // MARK: - Properties
    var navigationStyle: NavigationStyle {
        switch self {
        case .root:
            return .push(animated: true)
        }
    }
    
    var destinationViewController: UIViewController {
        switch self {
        case .root:
            return CarConfigurator.viewController(type: .listBrand)
        }
    }
}
