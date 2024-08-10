//
//  DelayedTransactionsRepositoryDecorator.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 08/05/2023.
//

import WOPDomain
import Foundation

final class DelayedTransactionsRepositoryDecorator: TransactionsRepositoryType {
    let repository: TransactionsRepositoryType
    
    init(repository: TransactionsRepositoryType) {
        self.repository = repository
    }
    
    /// Delayed response is intented here as required in task
    /// It can also randomly fail
    func fetchTransactions() async -> Result<[Transaction], NetworkError> {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        if Bool.random() {
            return await repository.fetchTransactions()
        } else {
            return .failure(.networkError)
        }
    }
}
