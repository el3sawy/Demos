//
//  ListItemsUseCaseTests.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 15/01/2024.
//

import XCTest
@testable import SmilesUnitTestDemo

final class ListItemsUseCaseTests: XCTestCase {
    
    private var sut: ListItemsUseCase!
    private var network: NetworkMock!
    
    override func setUpWithError() throws {
        network = NetworkMock()
        sut = ListItemsUseCase(network: network)
    }

    override func tearDownWithError() throws {
        network = nil
        sut = nil
    }
    
    func test_fetchItems_successResponse() throws {
        // Given
        let items = ProductStubs.products
        network.requestResponse = .success(items)
        // When
        let publisher = sut.fetchItems()
        let result = try awaitPublisher(publisher)
        // Then
        let expectedResult = ListItemsUseCase.State.success(items: items)
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_fetchItems_failureResponse() throws {
        // Given
        network.requestResponse = .failure(.invalidURL)
        // When
        let publisher = sut.fetchItems()
        let result = try awaitPublisher(publisher)
        // Then
        let expectedResult = ListItemsUseCase.State.showError(message: NetworkError.invalidURL.localizedDescription)
        XCTAssertEqual(result, expectedResult)
    }
}
