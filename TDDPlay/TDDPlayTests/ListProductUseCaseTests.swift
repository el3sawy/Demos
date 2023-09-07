//
//  ListProductUseCaseTests.swift
//  TDDPlayTests
//
//  Created by NTG on 07/06/2023.
//

import XCTest
@testable import TDDPlay

final class ListProductUseCaseTests: XCTestCase {
    
    var sut: ListProductUseCase!
    private var repo: ProductRepositoryMock!
    
    override func setUpWithError() throws {
        repo = ProductRepositoryMock()
        sut = ListProductUseCase(repo: repo)
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        repo = nil
    }
    
    
    func test_fetchProducts() {
        // Given
        var products: [ProductUiModel] = []
        let exp = expectation(description: "called data")
        
        
        // When
        sut.fetchProducts { result in
            products = (try? result.get()) ?? []
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
        
        // Then
        XCTAssertFalse(products.isEmpty)
        XCTAssertEqual(products.count, 100)
        
    }
}


class ProductRepositoryMock: ProductRepositoryProtocol {
    func fetchProduct(completion: @escaping (Result<[ProductResponseModel], Error>) -> Void) {
        completion(.success(ProductSTUB.getResponse()))
    }
}

