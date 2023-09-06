//
//  UserDataStub.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
@testable import TestAuth


struct UserStubs {
    static func createUser() -> UserModel {
        let input = UserInputFormModel(name: "Ahmed", phone: "01066336379", email: "ahmed@vois.com", password: "123456")
        let user = UserModel(user: input)
        return user
    }
    
}
