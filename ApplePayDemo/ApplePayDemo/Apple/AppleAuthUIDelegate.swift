//
//  AppleAuthUIDelegate.swift
//  ApplePayDemo
//
//  Created by NTG on 04/07/2023.
//

public typealias Expected<T> = Result<T, Error>
public typealias Handler<T> = (Expected<T>) -> Void
public typealias VoidCallback = () -> Void
public typealias Callback<T> = (_: T) -> Void

import AuthenticationServices

// MARK: - AppleAuthUIDelegateProtocol

public protocol AppleAuthUIDelegateProtocol: ASAuthorizationControllerDelegate {
    var onSuccess: VoidCallback { get set }
    var onFailure: Callback<ASAuthorizationError> { get set }
}

// MARK: - AppleAuthUIDelegate

public final class AppleAuthUIDelegate: NSObject, AppleAuthUIDelegateProtocol {
    
   public var onSuccess: VoidCallback
   public var onFailure: Callback<ASAuthorizationError>
    
    // MARK: - Init
    init(
        onSuccess: @escaping VoidCallback,
        onFailure: @escaping Callback<ASAuthorizationError>
    ) {
        self.onSuccess = onSuccess
        self.onFailure = onFailure
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Handle the user's Apple ID credential
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print(fullName ?? String(), " / ", email ?? String(), " / ", userIdentifier)
        }
        onSuccess()
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        guard let error = error as? ASAuthorizationError else {
            onFailure(.init(.unknown))
            return
        }
        
        onFailure(error)
    }
}



