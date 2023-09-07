//
//  DynamicTypeMVVMTests.swift
//  DynamicTypeMVVMTests
//
//  Created by Ahmed Elesawy on 13/02/2022.
//

import XCTest
@testable import DynamicTypeMVVM
class DynamicTypeMVVMTests: XCTestCase {

    var sut: Dynamic<String>!
    override func setUpWithError() throws {
        sut = Dynamic("")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test() {
        
        let exp = expectation(description: "aa")
        sut.subscribe { value in
           
            XCTAssertEqual(value, "ahemd")
            exp.fulfill()
        }
        sut.value = "ahemd"
        wait(for: [exp], timeout: 2)
        
    }
    

    
}
