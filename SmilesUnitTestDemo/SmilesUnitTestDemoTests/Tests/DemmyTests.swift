//
//  DemmyTests.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 16/01/2024.
//

import XCTest
@testable import SmilesUnitTestDemo
 
// final -> static and dynamic dispatch

final class DemmyTests: XCTestCase {

    private var sut: ListItemsViewModel!
    
    override func setUpWithError() throws {
        sut = ListItemsViewModel(useCase: ListItemsUseCase(network: Network()))
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func test_loadItems_failShowError() {
        
    }
    
    func test_loadItems_success() {
       
    }
    
    func test_loadItems_navigateToListProduct() {
      
       let exp = expectation(description: "Deasc")
        
        var result = 0
        sut.takeSomeTime { value in
            result = value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
       // Mock
    // unit test is Back Box
        
        XCTAssertEqual(result, 10)
            
    }

}
