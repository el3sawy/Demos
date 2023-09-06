//
//  AuthRepository.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation

protocol AuthRepositoryProtocol {
    var localStorage: LocalStorageProtocol {get}
    func addNewUser(_ user: UserModel, completion: @escaping (AppResponse<Bool>)-> Void)
    func getUser(email: String, completion: @escaping (AppResponse<UserModel>) -> Void)
}

class AuthRepository: AuthRepositoryProtocol { // Conforance to protocols should go in extension
    
    // Forgotten MARKS here :D
    
    var localStorage: LocalStorageProtocol
    
    init(localStorage: LocalStorageProtocol) {
        self.localStorage = localStorage
    }
    
    func addNewUser(_ user: UserModel, completion: @escaping (AppResponse<Bool>)-> Void) {
        localStorage.addNewUser(user, completion: completion)
    }

    func getUser(email: String, completion: @escaping (AppResponse<UserModel>)-> Void) {
        localStorage.getUserData(email: email, completion: completion)
    }
}
