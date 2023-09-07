//
//  CarRouter.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 28/07/2022.
//

import Foundation
import UIKit

enum CarRouter: RouterProtocol {
    
    // MARK: - Cases
    case listBrand
    case listCar
    
    // MARK: - Properties
    var navigationStyle: NavigationStyle {
        switch self {
        case .listCar, .listBrand:
            return .push(animated: true)
        }
    }
    
    var destinationViewController: UIViewController {
        switch self {
            
        case .listBrand:
            return CarConfigurator.viewController(type: .listBrand)
        case .listCar:
            return CarConfigurator.viewController(type: .listCar)
        }
    }
}
