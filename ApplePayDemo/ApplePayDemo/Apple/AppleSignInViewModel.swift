//
//  AppleSignInViewModel.swift
//  ApplePayDemo
//
//  Created by NTG on 04/07/2023.
//

import Foundation
import AuthenticationServices

public final class AppleSignInViewModel {
    @Published public var state: State = .idle
    
    public init() {
    }
    public init(uiDelegate: AppleAuthUIDelegateProtocol) {
        self.uiDelegate = uiDelegate
    }
    
    private lazy var uiDelegate: AppleAuthUIDelegateProtocol = AppleAuthUIDelegate(
        onSuccess: onSuccessHandler,
        onFailure: onFailureHandler)
    
    private lazy var onSuccessHandler: VoidCallback = { [weak self] in
        guard let self = self else { return }
        self.state = .success(SuccessMessage(title: "Authenticated!"))
    }
    
    private lazy var onFailureHandler: Callback<ASAuthorizationError> = { [weak self] error in
        guard let self = self else { return }
        guard error.code != .canceled else { return }
        self.state = .failure(.init(error))
    }
    
    public func attemptSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = uiDelegate
        authController.performRequests()
    }
}


extension AppleSignInViewModel {
    public enum State {
        case idle
        case success(SuccessMessage)
        case failure(AppleSignInError)
    }
}
