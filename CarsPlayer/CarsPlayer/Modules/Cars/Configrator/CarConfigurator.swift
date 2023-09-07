//
//  CarConfigurator.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 28/07/2022.
//

import Foundation
import UIKit

enum CarConfiguratorType {
    case listBrand
    case listCar
}

struct CarConfigurator {
    
    static func viewController(type: CarConfiguratorType) -> UIViewController {
        switch type {
        case .listBrand:
            return getListBrandView()
        case .listCar:
            return getListCarView()
        }
    }
    
    private static func getListBrandView() -> UIViewController {
        return ListBrandsViewController()
    }
    
    private static func getListCarView() -> UIViewController{
        return ListCarsViewController()
    }
}
