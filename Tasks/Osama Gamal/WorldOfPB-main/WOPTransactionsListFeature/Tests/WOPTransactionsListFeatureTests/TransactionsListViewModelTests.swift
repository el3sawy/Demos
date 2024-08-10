//
//  TestResource.swift
//  ConsumerNetworking-Unit-UnitTests
//
//  Created by Osama Gamal on 04/05/2023.
//

import WOPDomain
import XCTest
@testable import WOPTransactionsListFeature
import Combine

@MainActor
class TransactionsListViewModelTests: XCTestCase {
    
    var viewModel: TransactionsListViewModel!
    var mockRepository: MockTransactionsRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockTransactionsRepository()
        viewModel = TransactionsListViewModel(repository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testFetchTransactions_Success() async {
        // Given
        mockRepository.result = .success(mockRepository.sampleTransactions)

        // When
        await viewModel.fetchTransactions()

        // Then
        XCTAssertEqual(viewModel.state, .content(mockRepository.sampleTransactions))
    }

    
    func testFetchTransactions_Empty() async {
        // Given
        mockRepository.result = .success([])

        // When
        await viewModel.fetchTransactions()

        // Then
        XCTAssertEqual(viewModel.state, .empty)
    }

    func testFetchTransactions_Failure() async {
        // Given
        mockRepository.result = .failure(.networkError)

        // When
        await viewModel.fetchTransactions()

        // Then
        XCTAssertEqual(viewModel.state, .error(NetworkError.networkError))
    }
    
    func testSortTransactionsFromNewest() async {
        // Given
        let newTransaction = Transaction.stub(transactionDetail: .stub(bookingDate: Date() + 1))
        let oldTransaction = Transaction.stub(transactionDetail: .stub(bookingDate: Date() - 1))
        let olderTransaction = Transaction.stub(transactionDetail: .stub(bookingDate: Date() - 2))
        let oldestTransaction = Transaction.stub(transactionDetail: .stub(bookingDate: Date() - 3))
        
        mockRepository.result = .success([
            oldestTransaction,
            oldTransaction,
            olderTransaction,
            newTransaction])
        // When
        await viewModel.fetchTransactions()

        // Then
        XCTAssertEqual(viewModel.state, .content([
            newTransaction,
            oldTransaction,
            olderTransaction,
            oldestTransaction]))
    }
    
    func testSelectCategory() async {
        let firstTransactionCategory = Transaction.stub(category: .stub(id: 1))
        let secondTransactionCategory = Transaction.stub(category: .stub(id: 2))
        let thirdTransactionCategory = Transaction.stub(category: .stub(id: 3))
        // Given
        mockRepository.result = .success([firstTransactionCategory,
                                         secondTransactionCategory,
                                         thirdTransactionCategory])
        await viewModel.fetchTransactions()

        // When
        viewModel.didSelectCategoryAtIndex(1)

        // Then
        XCTAssertEqual(viewModel.selectedCategory, secondTransactionCategory.category)
        XCTAssertEqual(viewModel.state, .content([secondTransactionCategory]))
        XCTAssertNotNil(viewModel.sumOfTransacations)
    }
    
    func testDeselectCategory() async {
        let firstTransactionCategory = Transaction.stub(category: .stub(id: 1))
        let secondTransactionCategory = Transaction.stub(category: .stub(id: 2))
        let thirdTransactionCategory = Transaction.stub(category: .stub(id: 3))
        // Given
        mockRepository.result = .success([firstTransactionCategory,
                                         secondTransactionCategory,
                                         thirdTransactionCategory])
        await viewModel.fetchTransactions()

        // When
        viewModel.didSelectCategoryAtIndex(1)

        // Then
        XCTAssertEqual(viewModel.selectedCategory, secondTransactionCategory.category)
        XCTAssertEqual(viewModel.state, .content([secondTransactionCategory]))
        XCTAssertNotNil(viewModel.sumOfTransacations)
        
        // When
        viewModel.didSelectCategoryAtIndex(1)
        XCTAssertNil(viewModel.sumOfTransacations)
        XCTAssertNil(viewModel.selectedCategory)
    }
    
    func testFilterTransactionsByCategory() async {
        let firstTransactionCategory = Transaction.stub(category: .stub(id: 1))
        let secondTransactionCategory = Transaction.stub(category: .stub(id: 2))
        let thirdTransactionCategory = Transaction.stub(category: .stub(id: 3))
        // Given
        mockRepository.result = .success([firstTransactionCategory,
                                         secondTransactionCategory,
                                         thirdTransactionCategory])
        await viewModel.fetchTransactions()

        // When
        viewModel.didSelectCategoryAtIndex(1)

        // Then
        XCTAssertEqual(viewModel.state, .content([secondTransactionCategory]))
    }
    
    func testFilterTransactionsByCategory_When_Changing_From_Category_To_Another() async {
        let firstTransactionCategory = Transaction.stub(category: .stub(id: 1))
        let secondTransactionCategory = Transaction.stub(category: .stub(id: 2))
        let thirdTransactionCategory = Transaction.stub(category: .stub(id: 3))
        // Given
        mockRepository.result = .success([firstTransactionCategory,
                                         secondTransactionCategory,
                                         thirdTransactionCategory])
        await viewModel.fetchTransactions()

        // When
        viewModel.didSelectCategoryAtIndex(1)

        // Then
        XCTAssertEqual(viewModel.state, .content([secondTransactionCategory]))
        
        // When
        viewModel.didSelectCategoryAtIndex(2)

        // Then
        XCTAssertEqual(viewModel.state, .content([thirdTransactionCategory]))
    }

    
    func testCalculateSumOfTransactionsByCategory() async {
        // Given
        let firstTransactionCategory = Transaction.stub(category: .stub(id: 1), transactionDetail: .stub(value: .stub(amount: 100)))
        let secondTransactionCategory = Transaction.stub(category: .stub(id: 2), transactionDetail: .stub(value: .stub(amount: 50)))
        let thirdTransactionCategory = Transaction.stub(category: .stub(id: 2), transactionDetail: .stub(value: .stub(amount: 200)))
        
        // Given
        mockRepository.result = .success([firstTransactionCategory,
                                         secondTransactionCategory,
                                         thirdTransactionCategory])
        await viewModel.fetchTransactions()
        viewModel.didSelectCategoryAtIndex(1)

        // Then
        XCTAssertEqual(viewModel.sumOfTransacations, ["EGP": Transaction.Value(amount: 250, currency: "EGP")])
    }
}


