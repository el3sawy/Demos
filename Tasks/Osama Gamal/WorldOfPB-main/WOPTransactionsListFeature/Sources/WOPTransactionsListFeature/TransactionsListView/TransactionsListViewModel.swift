//
//  TransactionsListViewModel.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
import WOPDesignSystem
import WOPDomain
import WOPTransactionsUtilities

@MainActor
final class TransactionsListViewModel: NSObject, ObservableObject {
    private let repository: TransactionsRepositoryType
    @Published private(set) var state: ViewState<[WOPDomain.Transaction]> = .idle
    @Published private(set) var categories = [Transaction.Category]()
    @Published private(set) var selectedCategory: Transaction.Category?
    @Published private(set) var sumOfTransacations: [String: Transaction.Value]?

    private var transactions: [Transaction] = []
    private let transactionsCategoriesUtility: TransactionsCategoriesUtilityType
    private let transactionsSumUtility: TransactionsSumUtilityType
    
    init(repository: TransactionsRepositoryType,
         transactionsCategoriesUtility: TransactionsCategoriesUtilityType = TransactionsCategoriesUtility(),
         transactionsSumUtility: TransactionsSumUtilityType = TransactionsSumUtility()) {
        self.repository = repository
        self.transactionsCategoriesUtility = transactionsCategoriesUtility
        self.transactionsSumUtility = transactionsSumUtility
    }
    
    func fetchTransactions() async {
        state = .loading
        let result = await repository.fetchTransactions()
        switch result {
        case .success(let transactions):
            if transactions.isEmpty {
                state = .empty
            } else {
                let sortedTransactions = sortTransactionsFromNewest(transactions)
                state = .content(sortedTransactions)
                self.transactions = transactions
                self.categories = transactionsCategoriesUtility.categoriesForTransacations(transactions)
            }
        case .failure(let error):
            state = .error(error)
        }
    }
    
    func didSelectCategoryAtIndex(_ index: Int) {
        let selectedCategory = categories[index]
        if (selectedCategory == self.selectedCategory) {
            self.selectedCategory = nil
            self.sumOfTransacations = nil
            self.state = .content(self.transactions)
        } else {
            self.selectedCategory = selectedCategory
            let filteredTransacations = transactionsCategoriesUtility.filteredTransactionsForCategory(transactions: self.transactions, category: selectedCategory)
            self.state = .content(filteredTransacations)
            self.sumOfTransacations = transactionsSumUtility.sumForTransactions(transactions: filteredTransacations)
        }
    }
    
    private func sortTransactionsFromNewest(_ transactions: [Transaction]) -> [Transaction] {
        transactions.sorted(by: { $0.transactionDetail.bookingDate.compare($1.transactionDetail.bookingDate) == .orderedDescending })
    }
}
