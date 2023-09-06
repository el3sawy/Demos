//
//  ValidationsTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import XCTest
@testable import TestAuth

class ValidationsTests: XCTestCase {
    
    var stub: Validations! // the object that you are testing should have prefix or suffix "sut" stands for System Under Testing
    
    override func setUpWithError() throws {
        stub = Validations()
    }
    
    override func tearDownWithError() throws {
        stub = nil
    }
    
    
}
//MARK:- Test Name
extension ValidationsTests { // why did you make the tests in extension? Marks is enough
    
    func test_nameIsEmpty_returnNil() { // I would rather prefer to name this test "func test_nameIsEmpty_withEmptyName_returnNil" to follow the formate "func test_{functionName}_{behaviorOrParamtersState}_{expectedResults}"
        //given
        let name = ""
        // when
        let result = try? stub.name(value: name)
        // Then
        XCTAssertNil(result, "Must be nil because it empty")
    }
    func test_nameIsNil_returnNil() {
        // when
        let result = try? stub.name(value: nil)
        // Then
        XCTAssertNil(result, "Must be nil because it empty")
    }
    
    func test_nameIsEmpty_returnName() {
        //given
        let name = "Ahmed"
        // when
        let result = try? stub.name(value: name)
        // Then
        XCTAssertNotNil(result, "Must has value")
        XCTAssertEqual(name, result ?? "")
    }
}

//MARK:- Test Email
extension ValidationsTests {
    func test_emailIsEmpty_returnNil() {
        //given
        let email = ""
        var authError =  AuthErrorEnum.mobileEmpty
        //when and then
        XCTAssertThrowsError(try stub.email(value: email)) { error in // Good one
           authError =  error as! AuthErrorEnum
        }
        // you can make AuthErrorEnum conform to Equtable to avoid comparing strings and compare the whole object
        // but it is not a big deal, what you did is correct also and excellent
        XCTAssertEqual(authError.description, AuthErrorEnum.emailEmpty.description)
    }
    
    func test_emailIsNil_returnNil() {
        //given
        var authError =  AuthErrorEnum.mobileEmpty
        //when and then
        XCTAssertThrowsError(try stub.email(value: nil)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailEmpty.description)
    }
    func test_emailHasValue_NotValidMail() {
        //given
        let email = "ahmed@Vodafone"
        var authError =  AuthErrorEnum.mobileEmpty
        //when and then
        XCTAssertThrowsError(try stub.email(value: email)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailNotValid.description)
    }
    
    func test_emailHasValue_SuccessMail() {
        //given
        let email = "ahmed@Vodafone.com"
        //when
        let result = try? stub.email(value: email)
       //Then
        XCTAssertEqual( result, email, "Must be Success ")
    }
}

// MARK:- Test Mobile
extension ValidationsTests {
    func test_mobileIsEmpty_returnEnterMobileMessage() {
        //given
        let mobile = ""
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.mobile(value: mobile)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileEmpty.description)
    }
    
    func test_mobileIsNil_returnEnterMobileMessage() {
        //given
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.mobile(value: nil)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileEmpty.description)
    }
    
    func test_mobileNotEmptyButLessThan11Number_returnNotValidMessage() {
        //given
        let mobile = "01058585"
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.mobile(value: mobile)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileCount.description)
    }
    
    
    func test_mobileNotEmpty_returnSuccess() {
        //given
        let mobile = "01012345698"
        let result = try? stub.mobile(value: mobile)
        XCTAssertEqual(mobile, result)
    }
}

// MARK:- Test Password
extension ValidationsTests {
    func test_passwordIsEmpty_returnEnterPasswordMessage() {
        //given
        let pass = ""
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.password(value: pass)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordEmpty.description)
    }
    
    func test_passwordIsNil_returnEnterPasswordMessage() {
        //given
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.password(value: nil)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordEmpty.description)
    }
    
    func test_passwordNotEmptyButLessThan11Number_returnNotValidMessage() {
        //given
        let pass = "123"
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.password(value: pass)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordCount.description)
    }
    
    
    func test_passwordNotEmpty_returnSuccess() {
        //given
        let pass = "ahmed Nageeb"
        let result = try? stub.password(value: pass)
        XCTAssertEqual(pass, result)
    }
}
