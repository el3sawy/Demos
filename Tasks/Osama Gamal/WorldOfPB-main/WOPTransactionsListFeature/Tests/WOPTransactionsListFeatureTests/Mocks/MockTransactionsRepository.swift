//
//  File.swift
//  
//
//  Created by Osama Gamal on 08/05/2023.
//

import WOPDomain
@testable import WOPTransactionsListFeature

class MockTransactionsRepository: TransactionsRepositoryType {
    var result: Result<[Transaction], NetworkError>?

    func fetchTransactions() async -> Result<[Transaction], NetworkError> {
        if let result = result {
            return result
        } else {
            return .failure(.networkError)
        }
    }

    let sampleTransactions: [Transaction] = [
        .stub()
    ]
}
