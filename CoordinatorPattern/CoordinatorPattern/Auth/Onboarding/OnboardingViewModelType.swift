//
//  OnboardingViewModelType.swift
//  CoordinatorPattern
//
//  Created by NTG on 19/06/2023.
//

import Foundation

/// Onboarding Input & Output
typealias OnboardingViewModelType = OnboardingViewModelInput & OnboardingViewModelOutput

/// Onboarding ViewModel Input
protocol OnboardingViewModelInput {
    func startLogin()
    func skipLogin()
}

/// Onboarding ViewModel Output
protocol OnboardingViewModelOutput { }
