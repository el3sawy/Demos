//
//  Response Error.swift
//  Base
//
//  Created by Ahmed Elesawy on 11/23/20.
//  Copyright © 2020 Ahmed Elesawy. All rights reserved.
//

import Foundation

class ResponseError {
    static func filterError(error: Error) -> AppError {
        if let error =  error as NSError?, error.code == -1009 {
            return .noInternet
        } else {
            return AppError.error(error.localizedDescription)
        }
    }
}
