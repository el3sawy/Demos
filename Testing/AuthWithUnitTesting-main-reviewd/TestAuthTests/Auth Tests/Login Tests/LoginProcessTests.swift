//
//  LoginProcessTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 30/07/2021.
//

import XCTest
@testable import TestAuth

class LoginProcessTests: XCTestCase {

    var stub: LoginProcess!
    override func setUpWithError() throws {
        stub = LoginProcess()
    }

    override func tearDownWithError() throws {
        stub = nil
    }
    
    func test_LoginWithValidData_SuccessLogin() {
        //Given
        let user = UserStubs.createUser()
        let response = AppResponse.success(user)
        //When
        let result = stub.login(response, password: "123456")
        //Then
        switch result {
        
        case .success(let value):
            XCTAssertEqual(value.email, user.email)
            XCTAssertEqual(value.name, user.name)
            XCTAssertEqual(value.phone, user.phone)
        case .failure(_):
            XCTAssertThrowsError("There are some error in login func must be success")
        }
    }
    func test_LoginWithWrongPassword_FailLogin() {
        //Given
        let user = UserStubs.createUser()
        user.password = "123"
        let response = AppResponse.success(user)
        //When
        let result = stub.login(response, password: "123456")
        //Then
        switch result {
        
        case .success(_):
            XCTAssertThrowsError("There are some error in login func must be fail login")
        case .failure(let error):
            XCTAssertEqual(error.description, ResponseError.invalidUser.description)
        }
    }
    
    func test_LoginUserNotFound_FailLogin() {
        //Given
        let response = AppResponse<UserModel>.failure(.userNotFound)
        //When
        let result = stub.login(response, password: "123456")
        //Then
        switch result {
        case .success(_):
            XCTAssertThrowsError("There are some error in login func must be fail login")
        case .failure(let error):
            XCTAssertEqual(error.description, ResponseError.userNotFound.description)
        }
    }
}
