//
//  NetworkError.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation

enum NetworkError: Error{
    case faildDecode
    case serverError
    
    var localizedDescription :String {
        switch self {
        case .faildDecode:
            return NSLocalizedString("Can not Decode", comment: "eee")
        case .serverError:
            return "Internal Server Error"
        }
    }
}
