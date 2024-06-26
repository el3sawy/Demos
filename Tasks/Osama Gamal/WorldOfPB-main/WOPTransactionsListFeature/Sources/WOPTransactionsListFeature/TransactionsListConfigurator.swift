//
//  File.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
import WOPDomain
import SwiftUI

public protocol TransactionsListConfiguratorType: WOPFeature {
    func configure(dependencies: DependencyContainerType) -> AnyView
}

public class TransactionsListConfigurator: TransactionsListConfiguratorType {
    public init() { }
    public var featureId: String { return "TransactionsList" }
    
    @MainActor public func configure(dependencies: DependencyContainerType) -> AnyView {
        let repository = TransactionsRepository(networkService: dependencies.networking)
        let delayedTransactionsRepository = DelayedTransactionsRepositoryDecorator(repository: repository)
        
        let viewModel = TransactionsListViewModel(repository: delayedTransactionsRepository)
        return AnyView(TransactionsListView(viewModel: viewModel))
    }
}
