//
//  ChangePasswordTests.swift
//  ChangePasswordTests
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import XCTest
import ViewControllerPresentationSpy
@testable import ChangePassword

class ChangePasswordTests: XCTestCase {
    private var alertVerifier: AlertVerifier!
    var sut: ChangePasswordViewController!
    override func setUpWithError() throws {
        sut = ChangePasswordViewController()
        alertVerifier = AlertVerifier()
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        executeRunLoop()
        sut = nil
        alertVerifier = nil
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.cancelBarButton, "cancelButton")
        XCTAssertNotNil(sut.oldPasswordTextField, "oldPasswordTextField")
        XCTAssertNotNil(sut.newPasswordTextField, "newPasswordTextField")
        XCTAssertNotNil(sut.confirmPasswordTextField,"confirmPasswordTextField")
        XCTAssertNotNil(sut.submitButton, "submitButton")
    }
    
    func test_navigationBar_shouldHaveTitle() {
        XCTAssertEqual(sut.navigationBar.topItem?.title, "Change Password")
    }
    func test_oldPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.oldPasswordTextField.placeholder, "Old Password")
    }
    func test_newPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.newPasswordTextField.placeholder, "New Password")
    }
    func test_confirmPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.confirmPasswordTextField.placeholder, "Confirm New Password")
    }
    func test_submitButton_shouldHaveTitle() {
        XCTAssertEqual(sut.submitButton.titleLabel?.text, "Submit")
    }
    
    func test_tappingCancel_withFocusOnOldPassword_shouldResignThatFocus() {
        putFocusOn(textField: sut.newPasswordTextField)
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder, "precondition")
        tap(sut.cancelBarButton)
        XCTAssertFalse(sut.oldPasswordTextField.isFirstResponder)
    }
    func test_tappingSubmit_withOldPasswordEmpty_shouldPutFocusOnOldPassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        putInViewHierarchy(sut)
        tapButton(sut.submitButton)
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder)
    }
    func test_tappingOKPasswordBlankAlert_shouldPutFocusOnNewPassword() throws {
        setUpValidPasswordEntries()
        sut.newPasswordTextField.text = ""
        tapButton(sut.submitButton)
        putInViewHierarchy(sut)
        try alertVerifier.executeAction(forButton: "OK")
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
        
    }
    
    func test_tappingSubmit_withNewPasswordTooShort_shouldShowTooShortAlert() {
        setUpEntriesNewPasswordTooShort()
        tapButton(sut.submitButton)
        verifyAlertPresented(message: "The new password should have at least 6 characters.")
    }
    
    func test_tappingOKInTooShortAlert_shouldPutFocusOnNewPassword() throws {
        setUpEntriesNewPasswordTooShort()
        tapButton(sut.submitButton)
        putInViewHierarchy(sut)
        try alertVerifier.executeAction(forButton: "OK")
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withConfirmationMismatch_shouldShowMismatchAlert() {
        setUpMismatchedConfirmationEntry()
        tapButton(sut.submitButton)
        verifyAlertPresented(
            message: "The new password and the confirmation password " +
            "don’t match. Please try again.")
    }
    
    func test_tappingSubmit_withValidFields_shouldShowActivityIndicator() {
        setUpValidPasswordEntries()
        XCTAssertNil(sut.activityIndicator.superview, "precondition")
        
        tapButton(sut.submitButton)
        XCTAssertNotNil(sut.activityIndicator.superview)
    }
    func test_tappingSubmit_withValidFields_shouldStartActivityAnimation() {
        setUpValidPasswordEntries()
        XCTAssertFalse(sut.activityIndicator.isAnimating, "precondition")
        tapButton(sut.submitButton)
        XCTAssertTrue(sut.activityIndicator.isAnimating)
    }
    
}


extension ChangePasswordTests {
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    func putInViewHierarchy(_ vc: UIViewController) {
        let window = UIWindow()
        window.addSubview(vc.view)
    }
    func executeRunLoop() {
        RunLoop.current.run(until: Date())
    }
    
    private func putFocusOn(textField: UITextField) {
        putInViewHierarchy(sut)
        textField.becomeFirstResponder()
    }
    func tap(_ button: UIBarButtonItem) {
        _ = button.target?.perform(button.action, with: nil)
    }
    func tapButton(_ button: UIButton) {
        button.sendActions(for: .touchUpInside)
    }
    
    private func verifyAlertPresented(message: String, file: StaticString = #file, line: UInt = #line) {
        alertVerifier.verify(title: nil,message: message,animated: true, actions: [.default("OK"), ], presentingViewController: sut, file: file, line: line)
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK","preferred action", file: file, line: line)
    }
    
    private func setUpEntriesNewPasswordTooShort() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "12345"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    private func setUpMismatchedConfirmationEntry() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = "abcdef"
    }
}
