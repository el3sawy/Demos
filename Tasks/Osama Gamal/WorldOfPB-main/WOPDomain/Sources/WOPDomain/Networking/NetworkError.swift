//
//  NetworkError.swift
//
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
public enum NetworkError: Error {
    case invalidRequest
    case networkError
    case serverError
    case parseError
}
