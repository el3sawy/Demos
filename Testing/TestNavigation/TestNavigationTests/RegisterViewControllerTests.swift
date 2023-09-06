//
//  RegisterViewControllerTests.swift
//  TestNavigationTests
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import XCTest
@testable import TestNavigation


class RegisterViewControllerTests: XCTestCase {

    var sut: RegisterViewController!
    override func setUpWithError() throws {
        sut = RegisterViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_popViewController () {
        
        let nav = NavigationControllerSpy(rootViewController: sut)
        sut.btnRegsiterOutlet.sendActions(for: .touchUpInside)
        XCTAssertEqual(nav.isCalledPop, 1)
    }

}
