//
//  OnboardingViewModel.swift
//  CoordinatorPattern
//
//  Created by NTG on 19/06/2023.
//

import Foundation

final class OnboardingViewModel {
    
    weak var coordinator: AuthCoordinatorProtocol?
    
    init(coordinator: AuthCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
}

extension OnboardingViewModel: OnboardingViewModelInput {
    func startLogin() {
        coordinator!.didTapLogin()
    }
    
    func skipLogin() {
        coordinator?.skipLogin()
    }
}


extension OnboardingViewModel: OnboardingViewModelOutput {
    
}
