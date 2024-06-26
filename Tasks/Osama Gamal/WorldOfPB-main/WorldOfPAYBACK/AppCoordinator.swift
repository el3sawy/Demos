//
//  AppCoordinator.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 08/05/2023.
//

import SwiftUI
import WOPTransactionsListFeature

class AppCoordinator {
    private let dependencies: DependencyContainer
    private let transactionsListFeature: TransactionsListConfiguratorType

    init(dependencies: DependencyContainer) {
        self.dependencies = dependencies
        self.transactionsListFeature = TransactionsListConfigurator()
    }

    func start() -> AnyView {
        let networkService = NetworkServiceProxy(feature: transactionsListFeature, configurations: self.dependencies.configurations)
        
        let dependencies = DependencyContainer(networking: networkService, configurations: self.dependencies.configurations)
        let transactionsListView = transactionsListFeature.configure(dependencies: dependencies)
        return transactionsListView
    }
}
