////
////  AuthRepoMock.swift
////  TestAuthTests
////
////  Created by Ahmed Elesawy on 29/07/2021.
////
//
import Foundation
@testable import TestAuth

class AuthRepoMock: AuthRepositoryProtocol {
    
    // MARK: - Dependencies
    var localStorage: LocalStorageProtocol

    init(localStorage: LocalStorageProtocol) {
        self.localStorage = localStorage
    }

    // MARK: - Testing Properties
    var completionAddUser: ((AppResponse<Bool>) -> Void)?
    var completionGetUser: ((AppResponse<UserModel>) -> Void)?
    
    // MARK: - Mock Function
    func addNewUser(_ user: UserModel, completion: @escaping (AppResponse<Bool>) -> Void) {
        completionAddUser = completion
    }
    
    func getUser(email: String, completion: @escaping (AppResponse<UserModel>) -> Void) {
        completionGetUser = completion
    }
}
// MARK: - Mock Behaviours Add New User
extension AuthRepoMock {
    func successAddUser() {
        completionAddUser?(AppResponse.success(true))
    }
    
    func simulateErrorAddUser() {
        completionAddUser?(AppResponse.failure(.error))
    }
    
    func simulateUserIsExit() {
        completionAddUser?(AppResponse.failure(.userExist))
    }
}

// MARK: - Mock Behaviours Get User
extension AuthRepoMock {
    func successLogin() {
        let user = UserStubs.createUser()
        completionGetUser?(AppResponse.success(user))
    }
    
    func simulateUserNotFound() {
        completionGetUser?(AppResponse.failure(.userNotFound))
    }
    
    func simulateSomeThingErrorInLogin() {
        completionGetUser?(AppResponse.failure(.error))
    }
}

