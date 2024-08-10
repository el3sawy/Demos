//
//  LocalError.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Foundation

public enum LocalError: LocalizedError {
    
    case genericError
    case cityNameIsEmpty
    
    var localizedDescription: String {
        switch self {
        case .genericError:
            return "Generic Error"
        case .cityNameIsEmpty:
            return "City Name Can't be Empty"
        }
    }
}
