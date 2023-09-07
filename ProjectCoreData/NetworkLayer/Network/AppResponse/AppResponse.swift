//
//  AppResponse.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

public enum AppResponse <T> {
    case success(T)
    case error(NetworkError)
}

public enum NetworkError: Equatable, LocalizedError {
    case canNotDecode
    case noInternet
    case invalidURL
    case error(String)
    
    var description: String {
        switch self {
        case .canNotDecode:
            return "can't Decode"
        case .noInternet:
            return "No internet connection available please check your internet"
        case let .error(custom):
            return custom
        case .invalidURL:
            return "Invalid ULR check your path please"
        }
    }
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.description == rhs.description
    }
}
