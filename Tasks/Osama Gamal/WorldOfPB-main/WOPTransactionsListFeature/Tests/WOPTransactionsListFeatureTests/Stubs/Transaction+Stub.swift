//
//  File.swift
//  
//
//  Created by Osama Gamal on 08/05/2023.
//

@testable import WOPDomain
import Foundation

extension Transaction {
    static func stub(partnerDisplayName: String = "Display",
                     alias: Alias = .stub(),
                     category: Category = .stub(),
                     transactionDetail: TransactionDetail = .stub()) -> Self {
        return .init(partnerDisplayName: partnerDisplayName, alias: alias, category: category, transactionDetail: transactionDetail)
    }
}

extension Transaction.Value {
    static func stub(amount: Int = 10,
                     currency: String = "EGP") -> Self {
        return .init(amount: amount, currency: currency)
    }
}

extension Transaction.Category {
    static func stub(id: Int = 0) -> Self {
        return .init(id: id)
    }
}

extension Transaction.Alias {
    static func stub(reference: String = "1") -> Self {
        return .init(reference: reference)
    }
}

extension Transaction.TransactionDetail {
    static func stub(description: String = "Desc",
                     bookingDate: Date = Date(),
                     value: Transaction.Value = .stub()) -> Self {
        return .init(description: description, bookingDate: bookingDate, value: value)
    }
}
