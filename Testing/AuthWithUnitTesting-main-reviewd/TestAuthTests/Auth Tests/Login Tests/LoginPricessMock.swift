//
//  LoginPricessMock.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 08/08/2021.
//

import Foundation
@testable import TestAuth

//class LoginProcessMock: LoginProcessProtocol {
//
//    func login(_ response: AppResponse<UserModel>, password: String) -> AppResponse<UserModel> {
//
//    }
//}


class ValidationMock: ValidationsProtocol {
    
    var name: String?
    func name(value: String?) throws -> String {
        return name ?? ""
    }
    
    func setNameNull() {
        name = nil
    }
    
    
    
    func mobile(value: String?) throws -> String {
        return ""
    }
    
    func email(value: String?) throws -> String {
        return ""
    }
    
    func password(value: String?) throws -> String {
        return ""
    }
    
    
}
