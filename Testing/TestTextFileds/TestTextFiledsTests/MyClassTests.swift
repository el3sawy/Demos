//
//  MyClassTests.swift
//  TestTextFiledsTests
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import XCTest
@testable import TestTextFileds

class MyClassTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_methodOne() {
        let sut = MyClass()
        sut.methodOne()
        // Normally, assert something
     
    }
    func test_methodTwo() {
        let sut = MyClass()
        sut.methodTwo()
        // Normally, assert something
    }
    
}
