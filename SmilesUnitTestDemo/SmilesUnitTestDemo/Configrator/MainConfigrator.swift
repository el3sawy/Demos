//
//  MainConfigrator.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import Foundation
import UIKit

struct MainConfigurator {
    
    static func getListProduct() -> UIViewController {
        let useCase = ListProductUseCase()
        let worker = ProductDetailsWorker()
        let viewModel = ListProductViewModel(useCase: useCase, worker: worker)
        return ListProductViewController(viewModel: viewModel)
    }
    
    static func getListItems() -> UIViewController {
        let useCase = ListItemsUseCase(network: Network())
        let viewModel = ListItemsViewModel(useCase: useCase)
        return ListItemsViewController(viewModel: viewModel)
    }
}
