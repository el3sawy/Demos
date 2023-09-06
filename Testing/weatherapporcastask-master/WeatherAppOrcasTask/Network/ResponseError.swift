//
//  ResponseError.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation
import Alamofire

class ResponseError{
    
    static func filterError(error:AFError)->AppError{
        if let error =  error as NSError? , error.code == NSURLErrorNotConnectedToInternet {
            return .noInternet
        
        }else if  let error = error as NSError?, error.code == NSURLErrorTimedOut {
            return .timeOut
        }
        else{
            return .noInternet
        }
    }
}
