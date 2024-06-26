//
//  TransactionsResource.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 07/05/2023.
//

import WOPDomain
import Foundation

struct TransactionsResource: ResourceType {
    let method: HTTPMethod = .get
    let path = "transactions"
    let parameters: [RequestParameter] = []
    
    func baseURL(for environment: AppEnvironment) -> String {
        switch environment {
        case .production:
            return "https://api.payback.com"
        case .staging:
            return "https://api-test.payback.com"

        }
    }
    
    func parse(data: Data, response: HTTPURLResponse) throws -> [Transaction] {
        let decoder = JSONDecoder()
        let data = try decoder.decode([Transaction].self, from: data)
        return data
    }
}
