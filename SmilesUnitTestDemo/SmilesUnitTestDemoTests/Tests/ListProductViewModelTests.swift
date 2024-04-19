//
//  ListProductUseCaseTests.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import XCTest
@testable import SmilesUnitTestDemo

final class ListProductViewModelTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: ListProductViewModel!
    private var useCase: ListProductUseCaseMock!
    private var worker: ProductWorkerMock!
    
    // MARK: - Life Cycle
    override func setUpWithError() throws {
        useCase = ListProductUseCaseMock()
        worker = ProductWorkerMock()
        sut = ListProductViewModel(useCase: useCase, worker: worker)
    }
    
    override func tearDownWithError() throws {
        useCase = nil
        sut = nil
    }
    
    func test_fetchItems() {
        // Given
        let expectation = expectation(description: "Load Items")
        var items: [ItemModel] = []
        
        // When
        sut.itemsLoaded = { result in
            items = result
            expectation.fulfill()
        }
        sut.fetch()
        wait(for: [expectation] ,timeout: 1)
        
        // Then
        let result = ProductStubs.products
        XCTAssertEqual(result.count, items.count)
    }
    
    func test_fetchItems_memoryLeaks() {
        // Given
        let expectation = expectation(description: "Load Items")
        let viewModel = ListProductViewModel(useCase: useCase, worker: worker)
        
        // When
        viewModel.itemsLoaded = { result in
            expectation.fulfill()
        }
        viewModel.fetch()
        
        wait(for: [expectation], timeout: 1.1)
        // Then
        trackForMemoryLeak(instance: viewModel)
    }
    
    func test_getDetails_memoryLeaks() {
        // Given
        let viewModel = ListProductViewModel(useCase: useCase, worker: ProductDetailsWorker())
        
        // When
        viewModel.getDetails(id: 1)
        
        // Then
        trackForMemoryLeak(instance: viewModel)
    }
    
    
    
    
    
    
    func test_dd() {
        }
}
 
