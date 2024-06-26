//
//  TransactionsSumUtilityType.swift
//  WOPTransactionsUtilities
//
//  Created by Osama Gamal on 08/05/2023.
//
import WOPDomain

public protocol TransactionsSumUtilityType {
    func sumForTransactions(transactions: [Transaction]) -> [String: Transaction.Value]
}

public final class TransactionsSumUtility: TransactionsSumUtilityType {
    public init() { }
    
    /// Key is currency
    public func sumForTransactions(transactions: [Transaction]) -> [String: Transaction.Value] {
        let initialValue: [String: Transaction.Value] = [:]
        
        let result = transactions.reduce(into: initialValue) { (sums, transaction) in
            let value = transaction.transactionDetail.value
            let currency = value.currency
            
            if let existingSum = sums[currency] {
                sums[currency] = Transaction.Value(amount: existingSum.amount + value.amount, currency: currency)
            } else {
                sums[currency] = Transaction.Value(amount: value.amount, currency: currency)
            }
        }
        
        return result
    }
}
