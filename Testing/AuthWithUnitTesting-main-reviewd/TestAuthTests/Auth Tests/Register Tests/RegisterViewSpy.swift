//
//  RegisterViewSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import Foundation
@testable import TestAuth

class RegisterViewSpy: NSObject, RegisterViewProtocol {
    
    var isCalledAddUser = false
    var errorMessage = ""
    func didSuccessAddUser() {
        isCalledAddUser = true
    }
    
    func showMessage(_ message: String) {
        errorMessage = message
    }
}
