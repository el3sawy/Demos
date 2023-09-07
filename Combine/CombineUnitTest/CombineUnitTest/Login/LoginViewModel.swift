//
//  LoginViewModel.swift
//  CombineUnitTest
//
//  Created by NTG on 10/07/2023.
//

import Foundation
import Combine

final class LoginViewModel {
    // Input
    @Published var emailPublisher = ""
    @Published var passwordPublisher = ""
    @Published  var isButtonEnabled = false
    
    private var cancellables = Set<AnyCancellable>()
    // Output
    var isButtonEnabledPublisher: AnyPublisher<Bool, Never> {
        $isButtonEnabled.eraseToAnyPublisher()
    }
    
    init() {
        Publishers.CombineLatest($emailPublisher, $passwordPublisher)
            .map { (mail, pass) in
                
                return mail.count > 2 && pass.count > 2
            }
            .assign(to: &$isButtonEnabled)
        
    }
}





