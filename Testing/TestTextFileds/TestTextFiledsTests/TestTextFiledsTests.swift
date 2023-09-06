//
//  TestTextFiledsTests.swift
//  TestTextFiledsTests
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import XCTest
@testable import TestTextFileds

class TestTextFiledsTests: XCTestCase {
    
    private var sut: HomeViewController!
    override func setUpWithError() throws {
        sut = HomeViewController()
        sut.loadViewIfNeeded()
        
    }
    
    override func tearDownWithError() throws {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    func test_OutletsConnections() {
        XCTAssertNotNil(sut.passwordField)
        XCTAssertNotNil(sut.usernameField)
    }
    
    func test_usernameField_attributesShouldBeSet() {
        let textField = sut.usernameField
        XCTAssertEqual(textField?.textContentType, .username)
        XCTAssertEqual(textField?.autocorrectionType, .no)
        XCTAssertEqual(textField?.returnKeyType, .next)
    }
    
    func test_passwordField_attributesShouldBeSet() {
        let textField = sut.passwordField!
        XCTAssertEqual(textField.textContentType, .password)
        XCTAssertEqual(textField.returnKeyType, .go)
        XCTAssert(textField.isSecureTextEntry)
    }
    
    func test_textFieldDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.passwordField.delegate)
        XCTAssertNotNil(sut.passwordField.delegate)
    }
    
    func test_shouldChangeCharacters_usernameWithSpaces_shouldPreventChange() {
        let allowChange = shouldChangeCharacters(in: sut.usernameField, value: "a ab")
        XCTAssertEqual(allowChange, false)
    }
    
    func test_shouldChangeCharacters_usernameWithoutSpaces_shouldAllowChange() {
        let allowChange = shouldChangeCharacters(in: sut.usernameField, value: "ahmed")
        XCTAssertEqual(allowChange, true)
    }
    
    func shouldChangeCharacters(in textFiled: UITextField, value: String) -> Bool? {
        textFiled.delegate?.textField?(textFiled, shouldChangeCharactersIn: NSRange(), replacementString: value)
    }
    
    func test_shouldReturn_withUsername_shouldMoveInputFocusToPassword() {
        putInViewHierarchy(sut)
        shouldReturn(in: sut.usernameField)
        XCTAssert(sut.passwordField.isFirstResponder)
    }
    
    func test_shouldReturn_withPassword_shouldDismissKeyboard() {
        putInViewHierarchy(sut)
        sut.passwordField.becomeFirstResponder()
        XCTAssertTrue(sut.passwordField.isFirstResponder, "precondition")
        shouldReturn(in: sut.passwordField)
        XCTAssertFalse(sut.passwordField.isFirstResponder)
    }
    
    
    @discardableResult func shouldReturn(in textFiled: UITextField) -> Bool? {
        
        return textFiled.delegate?.textFieldShouldReturn?(textFiled)
    }
    func putInViewHierarchy(_ vc: UIViewController) {
        let window = UIWindow()
        window.addSubview(vc.view)
    }
    func executeRunLoop() {
        RunLoop.current.run(until: Date())
    }
    
    
}
