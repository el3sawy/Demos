//
//  LoginViewModelProtocol.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import Foundation

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func performSignIn()
}

protocol LoginViewModelOutput {
    
}
