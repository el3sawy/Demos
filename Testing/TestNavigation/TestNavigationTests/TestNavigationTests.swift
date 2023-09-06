//
//  TestNavigationTests.swift
//  TestNavigationTests
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import XCTest
@testable import TestNavigation

class TestNavigationTests: XCTestCase {

    var sut: LoginViewController!
    override func setUpWithError() throws {
        sut = LoginViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWhenTappedButton_RegisterViewControllerIsPushed() {
        let navigation = NavigationControllerSpy(rootViewController: sut)
        sut.btnPushOutlet.sendActions(for: .touchUpInside)
        print(navigation.viewControllers.count)
        XCTAssert(navigation.pushedViewController is RegisterViewController)
    }

}
