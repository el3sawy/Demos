//
//  TransactionsCategoriesUtility.swift
//  TransactionsCategoriesUtility
//
//  Created by Osama Gamal on 08/05/2023.
//
import WOPDomain

public protocol TransactionsCategoriesUtilityType {
    func filteredTransactionsForCategory(transactions: [Transaction], category: Transaction.Category) -> [Transaction]
    func categoriesForTransacations(_ transactions: [Transaction]) -> [Transaction.Category]
}

public final class TransactionsCategoriesUtility: TransactionsCategoriesUtilityType {
    public init() { }
    
    public func filteredTransactionsForCategory(transactions: [Transaction], category: Transaction.Category) -> [Transaction] {
        return transactions.filter { transaction in
            transaction.category == category
        }
    }
    
    public func categoriesForTransacations(_ transactions: [Transaction]) -> [Transaction.Category] {
        return Array(Set(transactions.map { $0.category })).sorted(by: { $0.id < $1.id })
    }
}
