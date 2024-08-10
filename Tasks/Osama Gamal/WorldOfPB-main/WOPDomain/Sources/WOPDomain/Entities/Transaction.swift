//
//  Transaction.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation

public struct TransactionResponse: Codable {
    public let items: [Transaction]
}

public struct Transaction: Codable, Hashable {
    public init(partnerDisplayName: String, alias: Transaction.Alias, category: Transaction.Category, transactionDetail: Transaction.TransactionDetail) {
        self.partnerDisplayName = partnerDisplayName
        self.alias = alias
        self.category = category
        self.transactionDetail = transactionDetail
    }
    
    public let partnerDisplayName: String
    public let alias: Alias
    public let category: Category
    public let transactionDetail: TransactionDetail
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        partnerDisplayName = try container.decode(String.self, forKey: .partnerDisplayName)
        alias = try container.decode(Alias.self, forKey: .alias)
        
        let categoryID = try container.decode(Int.self, forKey: .category)
        category = Category(id: categoryID)
        
        transactionDetail = try container.decode(TransactionDetail.self, forKey: .transactionDetail)
    }

}

public extension Transaction {
    struct Alias: Codable, Hashable {
        public let reference: String
    }
    
    struct TransactionDetail: Codable, Hashable {
        public let description: String?
        public let bookingDate: Date
        public let value: Value
    }
    
    struct Value: Codable, Hashable {
        public init(amount: Int, currency: String) {
            self.amount = amount
            self.currency = currency
        }
        
        public let amount: Int
        public let currency: String
    }
    
    struct Category: Codable, Hashable, Equatable {
        public let id: Int
    }
}
