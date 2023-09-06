//
//  LoginViewSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import Foundation
@testable import TestAuth

class LoginViewSpy: NSObject, LoginViewProtocol {
    
    var isCalledLoginSuccess = false
    var errorMessage = ""
    func successLogin(user: UserModel) {
        isCalledLoginSuccess = true
    }
    
    func showMessage(_ message: String) {
        errorMessage = message
    }
}
