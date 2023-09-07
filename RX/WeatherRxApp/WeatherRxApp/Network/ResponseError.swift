//
//  ResponseError.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

class ResponseError {
    static func filterError(error: Error) -> AppError {
        if let error =  error as NSError?, error.code == -1009 {
            return .noInternet
        } else if let error = error as NSError?, error.code ==  -999 {
            return .failedPinning
        } else {
            return AppError.error(error.localizedDescription)
        }
    }
}
