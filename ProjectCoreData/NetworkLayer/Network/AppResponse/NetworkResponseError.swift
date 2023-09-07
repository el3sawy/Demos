//
//  NetworkResponseError.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

enum NetworkResponseError {
    
   static func filterError(error: Error) -> NetworkError {
        if let error =  error as NSError?, error.code == -1009 {
            return .noInternet
        } else {
            return NetworkError.error(error.localizedDescription)
        }
    }
}
