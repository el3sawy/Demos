//
//  MockedTransactionsResource.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 07/05/2023.
//

import WOPDomain
import Foundation

struct MockedTransactionsResource: ResourceType {
    let method: HTTPMethod = .get
    let path = "v1/0d64d66e-8c7b-43f8-a729-1aa92a8bfc7c"
    let parameters: [RequestParameter] = []
    
    func baseURL(for environment: AppEnvironment) -> String {
        return "https://mocki.io"
    }
    
    func parse(data: Data, response: HTTPURLResponse) throws -> [Transaction] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let data = try decoder.decode(TransactionResponse.self, from: data)
        return data.items
    }
}
