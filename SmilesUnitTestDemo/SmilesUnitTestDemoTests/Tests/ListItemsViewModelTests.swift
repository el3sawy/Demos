//
//  ListItemsViewModelTests.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 16/01/2024.
//

import XCTest
@testable import SmilesUnitTestDemo

final class ListItemsViewModelTests: XCTestCase {
    
    private var sut: ListItemsViewModel!
    private var useCase: ListItemsUseCaseMock!
    
    override func setUpWithError() throws {
        useCase = ListItemsUseCaseMock()
        sut = ListItemsViewModel(useCase: useCase)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        useCase = nil
    }
    
     func test_loadItems_success() {
        
        // Given
        let result = PublisherSpy(sut.statePublisher.collectNext(2))
        let items = ProductStubs.products
     
         useCase.fetchItemsResponse = .success(.success(items: items))
        // When
        sut.loadItems()
        // Then
         XCTAssertEqual(result.value, [.hideLoader, .success(items: items) ])
    }
}
