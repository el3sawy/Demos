//
//  AppResponse.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

enum AppResponse <T> {
    case success(T)
    case error(AppError)
}

enum AppError: Equatable, LocalizedError {
    case cannotDecode // Handle ComminDate
    case noInternet // ---
    case error(String) // Error.Description
    case failedPinning
    case lostDevice
    
    var description: String {
        switch self {
        case .cannotDecode:
            return "cannotDecode"
        case .noInternet:
            return "No internet connection available please check your internet"
        case let .error(err):
            return err
        case .failedPinning:
            return "Certificate Failed"
        case .lostDevice:
            return ""
        }
    }
    
    static func == (lhs: AppError, rhs: AppError) -> Bool {
        return lhs.description == rhs.description
    }
}
