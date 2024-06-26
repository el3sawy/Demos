//
//  TransactionsCategoriesUtilityTests.swift
//  WOPTransactionsUtilitiesTests
//
//  Created by Osama Gamal on 08/05/2023.
//

import XCTest
@testable import WOPTransactionsUtilities
import WOPDomain

class TransactionsSumUtilityTests: XCTestCase {
    var sut: TransactionsSumUtility!
    
    override func setUp() {
        super.setUp()
        sut = TransactionsSumUtility()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_sumForTransactions() {
        let transaction1 = Transaction.stub(transactionDetail: .stub(value: .init(amount: 100, currency: "EGP")))
        let transaction2 = Transaction.stub(transactionDetail: .stub(value: .init(amount: 200, currency: "EGP")))
        let transaction3 = Transaction.stub(transactionDetail: .stub(value: .init(amount: 300, currency: "EGP")))
        let transaction4 = Transaction.stub(transactionDetail: .stub(value: .init(amount: 100, currency: "USD")))

        let sum = sut.sumForTransactions(transactions: [transaction1, transaction2, transaction3, transaction4])
        
        XCTAssertEqual(sum, ["EGP": Transaction.Value(amount: 600, currency: "EGP"),
                             "USD": Transaction.Value(amount: 100, currency: "USD")])
    }
}
