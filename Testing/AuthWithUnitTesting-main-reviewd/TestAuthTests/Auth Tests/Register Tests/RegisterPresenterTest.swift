//
//  RegitserTest.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import XCTest
@testable import TestAuth
class RegisterPresenterTest: XCTestCase {
    
    var view: RegisterViewSpy!
    var repo: AuthRepoMock!
    var validation: Validations!
    var localStorageSpy: LocalStorageSpy!
    var stub: RegisterPresenter!
    
    override func setUpWithError() throws {
        view = RegisterViewSpy()
        localStorageSpy = LocalStorageSpy()
        repo = AuthRepoMock(localStorage: localStorageSpy)
        validation = Validations()
        stub = RegisterPresenter(view: view, repo: repo, validator: validation)
    }

    override func tearDownWithError() throws {
        view = nil
        repo = nil
        validation = nil
        localStorageSpy = nil
        stub = nil
    }
    
    func test_AddNewUser_SuccessAdded() {
        //given
        let user = UserInputFormModel(name: "Ahmed", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        stub.register(user: user)
        repo.successAddUser()
        //Then
        XCTAssertTrue(view.isCalledAddUser)
        
    }
    
    func test_AddNewUser_ErrorAdd() {
        //given
        let user = UserInputFormModel(name: "Ahmed", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        stub.register(user: user)
        repo.simulateErrorAddUser()
        //Then
        XCTAssertFalse(view.isCalledAddUser)
        XCTAssertEqual(view.errorMessage, ResponseError.error.description)
    }
    
    func test_AddNewUser_ErrorAddUserIsExits() {
        //given
        let user = UserInputFormModel(name: "Ahmed", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        stub.register(user: user)
        repo.simulateUserIsExit()
        //Then
        XCTAssertFalse(view.isCalledAddUser)
        XCTAssertEqual(view.errorMessage, ResponseError.userExist.description)
    }
    
    func test_AddNewUser_NameIsEmpty() {
        //given
        let user = UserInputFormModel(name: "", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        stub.register(user: user)
        //Then
        XCTAssertEqual(view.errorMessage, AuthErrorEnum.nameEmpty.description)
    }
}
