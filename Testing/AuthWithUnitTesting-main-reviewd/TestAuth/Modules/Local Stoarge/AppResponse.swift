//
//  AppResponse.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation

enum AppResponse <T> {
    case success(T)
    case failure(ResponseError)
}

enum ResponseError {
    case userExist
    case error
    case userNotFound
    case invalidUser
    
    var description: String {
        switch self {
        case .userExist:
            return "Your email is already token"
        case .error:
            return "There are some errors found, keep calm we will solve it"
        case .userNotFound:
            return "Your account not found in our system"
        case .invalidUser:
            return "Password or email is not correct"
        }
    }
}
