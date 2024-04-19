//
//  DiFactoryDemoTests.swift
//  DiFactoryDemoTests
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import XCTest
@testable import DiFactoryDemo

final class DiFactoryDemoTests: XCTestCase {

    var sut: ListProductViewController!
    override func setUpWithError() throws {
       sut = ListProductViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test() { 
        let sut2: ListProductViewController = ListProductViewController()
        sut2.viewModel = Mock()
        sut2.configureViewModel()
        sut2.fetchData()
       
//        addTeardownBlock { [weak sut2] in
//            XCTAssertNil(sut2)
//        }
        trackForMemoryLeak(instance: sut2)
    }

   

}


class Mock: ListProductViewModelProtocol {
    func fetchItems() {
        fetchCompletion?([.init(id: 2, name: "ww")])
    }
    
    var fetchCompletion: (([Item]) -> Void)?
    
    
}


extension XCTestCase {
    func trackForMemoryLeak(instance: AnyObject,
                            file: StaticString = #filePath,
                            line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance,
                "potential memory leak on \(String(describing: instance))",
                file: file,
                line: line
            )
        }
    }
}
