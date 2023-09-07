//
//  Api.swift
//  Signup+SwiftUI
//
//  Created by Ahmed Elesawy on 30/01/2023.
//

import Foundation
import Combine

struct API {
    static func checkUserNameAvailable(userName: String) -> AnyPublisher<Bool, Never> {
        if userName == "Ahmed" {
            return Just(true)
                .eraseToAnyPublisher()
        } else {
            return Just(false)
                .eraseToAnyPublisher()
        }
    }
    
    static func checkUserName(userName: String) -> AnyPublisher<Bool, Error> {
        if userName == "Ahmed" {
            return Just(true)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            
        } else {
            return Fail(error: CustomError.bad).eraseToAnyPublisher()
        }
    }
    
    
}


enum CustomError: Error {
    case bad
}

struct UserNameAvailableMessage: Codable {
    var isAvailable: Bool = false
}
