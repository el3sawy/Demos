//
//  AuthErrorEnum.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation


enum AuthErrorEnum: LocalizedError {
    case mobileEmpty
    case mobileCount
    case emailEmpty
    case emailNotValid
    case passwordEmpty
    case passwordCount
    case nameEmpty
    
    var description: String{
        switch self {
        case .mobileEmpty:
            return "Enter Mobile"
        case .mobileCount:
            return "Mobile number must be 11 numbers"
        case .emailEmpty:
            return "Enter email"
        case .emailNotValid:
            return "Email not valid"
        case .passwordEmpty:
            return "Enter Password"
        case .passwordCount:
            return "Password must be more than 5 characters"
        case .nameEmpty:
            return "Enter name"
        }
    }
}
