//
//  LoginPresenterTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import XCTest
@testable import TestAuth

class LoginPresenterTests: XCTestCase {
    
    // forgtten MARKS
    
    var view: LoginViewSpy!
    var repo: AuthRepoMock!
    var validation: Validations!
    var localStorageSpy: LocalStorageSpy!
    var loginProcess: LoginProcessProtocol!
    var stub: LoginPresenter! // sut not stub
    
    override func setUpWithError() throws {
        // you can make a TestConfigurator is you wish
        
        localStorageSpy = LocalStorageSpy()
        repo = AuthRepoMock(localStorage: localStorageSpy)
        loginProcess = LoginProcess() // you must use a test object here not real object, kind of mock class for the LoginProcessProtocol
        validation = Validations() // Well, in case of the validation object, you got to use a mock one this the right way but the real object here can fit but it will cause a problems later one I think, keep it in your mind and let us discuss it on call
        view = LoginViewSpy()
        stub = LoginPresenter(view: view, repo: repo, loginProcess: loginProcess, validator: validation)
    }
    
    override func tearDownWithError() throws {
        view = nil
        repo = nil
        validation = nil
        localStorageSpy = nil
        loginProcess = nil
        stub = nil
    }
    
    func test_login_success() {
        //given
        let user = UserStubs.createUser()
        let email = user.email
        let password = user.password
        let response = AppResponse.success(user)
        //when
        stub.login(email: email, password: password)
        let _ = loginProcess.login( response, password: password)
        repo.successLogin()
        //Then
        XCTAssert(view.isCalledLoginSuccess)
    }
    
    func test_login_passwordNotMatch() {
        //given
        let user = UserStubs.createUser()
        let email = user.email
        let password = "111111"
        let response = AppResponse.success(user)
        //when
        stub.login(email: email, password: password)
        let _ = loginProcess.login( response, password: password) // you should not call this function here explicilty, it should be called thanks to stub.login(email: email, password: password) inside the LoginPresenter class
        repo.successLogin()
        //Then
        XCTAssertEqual(view.errorMessage, ResponseError.invalidUser.description)
    }
    
    func test_login_userNotFound() {
        //given
        let user = UserStubs.createUser()
        let email = "ahmed@gamil.vois"
        let password = "111111"
        let response = AppResponse.success(user)
        //when
        stub.login(email: email, password: password)
        let _ = loginProcess.login( response, password: password)
        repo.simulateUserNotFound()
        //Then
        XCTAssertEqual(view.errorMessage, ResponseError.userNotFound.description)
    }
    
    func test_Login_NotValidEmail() {
        //given
        let email = "ahmed@vois"
        let password = "111111"
        //when
        stub.login(email: email, password: password)
        //Then
        XCTAssertEqual(view.errorMessage, AuthErrorEnum.emailNotValid.description)
    }
}
