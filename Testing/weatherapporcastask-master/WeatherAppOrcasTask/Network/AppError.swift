//
//  CustomeError.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation

import Foundation

enum AppRepsone<T> {
    case success(T)
    case error(AppError)
}

enum AppError {
    case cannotDecode // Handle ComminDate
    case noInternet // ---
    case error(String) // Error.Description
    case tokenExpire // 401
    case validateInputs // 412
    case badUrl // 400
    case forbiden // 403
    case internalServerError // 500
    case cannotDecodeItem(String)
    case timeOut
    var description: String {
        switch self {
        case let .cannotDecodeItem(key):
            return "cannotDecode + \(key)"
        case .cannotDecode:
            return "cannotDecode"
        case .noInternet:
            return "noInternet"
        case let .error(err):
            return err
        case .tokenExpire:
            return "tokenExpire"
        case .validateInputs:
            return "validateInputs"
        case .badUrl:
            return "badUrl"
        case .forbiden:
            return "forbiden"
        case .internalServerError:
            return "internalServerError"
        case .timeOut:
            return "timeOut"
        }
    }
}

