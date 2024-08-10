//
//  TransactionsCategoriesUtilityTests.swift
//  WOPTransactionsUtilitiesTests
//
//  Created by Osama Gamal on 08/05/2023.
//

import XCTest
@testable import WOPTransactionsUtilities
import WOPDomain

class TransactionsCategoriesUtilityTests: XCTestCase {
    var sut: TransactionsCategoriesUtility!
    
    override func setUp() {
        super.setUp()
        sut = TransactionsCategoriesUtility()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_filteredTransactionsForCategory() {
        let filterCategory = Transaction.Category.stub(id: 100)
        
        let transaction1 = Transaction.stub(category: filterCategory)
        let transaction2 = Transaction.stub(category: filterCategory)
        let transaction3 = Transaction.stub(category: .stub())
        let transaction4 = Transaction.stub(category: .stub())
        
        let filtered = sut.filteredTransactionsForCategory(transactions: [transaction1, transaction2, transaction3, transaction4], category: filterCategory)
        
        XCTAssertEqual(filtered, [transaction1, transaction2])
    }
    
    func test_categoriesForTransacations() {
        let category1 = Transaction.Category.stub(id: 100)
        let category2 = Transaction.Category.stub(id: 200)

        let transaction1 = Transaction.stub(category: category1)
        let transaction2 = Transaction.stub(category: category1)
        let transaction3 = Transaction.stub(category: category2)
        let transaction4 = Transaction.stub(category: category2)
        
        let categories = sut.categoriesForTransacations([transaction1, transaction2, transaction3, transaction4])
        
        XCTAssertEqual(categories, [category1, category2])
    }

}
