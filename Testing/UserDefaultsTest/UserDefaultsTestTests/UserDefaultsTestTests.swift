//
//  UserDefaultsTestTests.swift
//  UserDefaultsTestTests
//
//  Created by Ahmed Elesawy on 13/01/2022.
//

import XCTest
@testable import UserDefaultsTest

class UserDefaultsTestTests: XCTestCase {
    
    private var sut: HomeViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUpWithError() throws {
        defaults = FakeUserDefaults()
        sut = HomeViewController()
        sut.userDefaults = defaults
//        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
       sut = nil
        defaults = nil
    }
    
    func test_ViewDidLoad_WithInitlaValueZero() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.lableCounter.text, "0")
    }
    
    func test_ViewDidLoad_WithValue8Zero() {
        defaults.integers = ["count": 8]
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.lableCounter.text, "8")
    }
    
    func test_ButtonTapped() {
        defaults.integers = ["count": 8]
        sut.loadViewIfNeeded()
        sut.btnCounter.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.lableCounter.text, "9")
    }
}
