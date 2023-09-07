//
//  RegisterViewModel.swift
//  RegisterForm
//
//  Created by Ahmed Elesawy on 20/09/2022.
//

import Foundation
import Combine

class RegisterViewModel {
    
    // MARK: - Properties
    var name = CurrentValueSubject<String, Never>("")
    var email = CurrentValueSubject<String, Never>("")
    var password = CurrentValueSubject<String, Never>("")
    var reenterPassword = CurrentValueSubject<String, Never>("")
    @Published private(set) var isEnableButton = false
    
    // MARK: - Init
    init() {
        isSignupFormValidPublisher.assign(to: &$isEnableButton)
    }
    
    private var isValidName: AnyPublisher<Bool, Never> {
        name.map { return $0.count > 3 }
        .eraseToAnyPublisher()
    }
    
    private var isValidMail: AnyPublisher<Bool, Never> {
        email.debounce(for: 0.3, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map { return $0.isValidEmail() }
            .eraseToAnyPublisher()
    }
    
    private var isValidPassword: AnyPublisher<Bool, Never> {
        password.map { return $0.count >= 6 }
        .eraseToAnyPublisher()
    }
    
    private var passwordMatch: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(password, reenterPassword)
            .map {  return $0 == $1}
            .eraseToAnyPublisher()
    }
    
    private var isSignupFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(isValidName, isValidMail, isValidPassword, passwordMatch)
            .map { return $0 && $1 && $2 && $3 }
            .eraseToAnyPublisher()
    }
}
