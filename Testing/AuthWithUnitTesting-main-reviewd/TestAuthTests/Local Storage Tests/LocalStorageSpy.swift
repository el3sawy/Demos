//
//  LocalStorageSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
@testable import TestAuth

class LocalStorageSpy: LocalStorageProtocol {
    
    // MARK: - Testing Properties
    var isCalledAddNewUser = false
    var isCalleGetUserData = false
    
    // MARK: - Spy Functions
    func addNewUser(_ user: UserModel, completion: (AppResponse<Bool>) -> Void) {
        isCalledAddNewUser = true
    }
    
    func getUserData(email: String, completion: (AppResponse<UserModel>) -> Void) {
        isCalleGetUserData = true
    }
}
