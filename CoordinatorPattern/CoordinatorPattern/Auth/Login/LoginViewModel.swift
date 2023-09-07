//
//  LoginViewModel.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import Foundation

final class LoginViewModel {
    weak var coordinator: AuthCoordinatorProtocol?
    
    init(coordinator: AuthCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
}


extension LoginViewModel: LoginViewModelInput {
    func performSignIn() {
        LocalStorage.shared.setLogin(value: true)
        self.coordinator?.didFinishSignIn()
    }
}

extension LoginViewModel: LoginViewModelOutput {
    
}


