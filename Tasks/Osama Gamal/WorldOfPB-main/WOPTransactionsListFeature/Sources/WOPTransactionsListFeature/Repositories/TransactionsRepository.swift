//
//  TransactionsRepository.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 07/05/2023.
//

import WOPDomain
import Foundation

protocol TransactionsRepositoryType {
    func fetchTransactions() async -> Result<[Transaction], NetworkError>
}

final class TransactionsRepository: TransactionsRepositoryType {
    let networkService: NetworkingType
    
    init(networkService: NetworkingType) {
        self.networkService = networkService
    }
    
    func fetchTransactions() async -> Result<[Transaction], NetworkError> {
        let resource = MockedTransactionsResource()
        return await networkService.request(resource)
    }
}
