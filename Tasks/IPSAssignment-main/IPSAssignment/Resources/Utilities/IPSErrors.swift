//
//  IPSErrors.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

enum IPSErrors: LocalizedError {
    /// Invalid URL
    case withMessage(String)
    
    /// File is not writable
    case notWritableFile
    
    /// File not found
    case fileNotFound
}

struct IPSErrorMessage: Decodable {
    let error: String
}
