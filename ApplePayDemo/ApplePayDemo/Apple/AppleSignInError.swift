//
//  AppleSignInError.swift
//  ApplePayDemo
//
//  Created by NTG on 04/07/2023.
//

import AuthenticationServices

public struct AppleSignInError {
    public let title: String
    public let description: String?
    
    public init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
    }
}

extension AppleSignInError {
    init(_ authError: ASAuthorizationError) {
        switch authError.code {
        case .unknown:
            self = .init(title: "Something went wrong", description: "with an unknown reason")
        default:
            self = .init(title: "Sign in failed")
        }
    }
}

