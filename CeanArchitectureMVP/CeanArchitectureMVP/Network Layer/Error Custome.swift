//
//  File.swift
//  Base
//
//  Created by Ahmed Elesawy on 11/23/20.
//  Copyright © 2020 Ahmed Elesawy. All rights reserved.
//

import Foundation

enum AppResponse <T> {
    case success(T)
    case error(AppError, T? = nil)
}

enum AppError: Equatable, LocalizedError {
    case cannotDecode // Handle ComminDate
    case noInternet 
    case error(String) // Error.Description
    
    var description: String {
        switch self {
        case .cannotDecode:
            return "cannotDecode"
        case .noInternet:
            return "No internet connection available please check your internet"
        case let .error(err):
            return err
        }
    }
    
    static func == (lhs: AppError, rhs: AppError) -> Bool {
        return lhs.description == rhs.description
    }
}
