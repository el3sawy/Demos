//
//  OnboardingViewController.swift
//  CoordinatorPattern
//
//  Created by NTG on 19/06/2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let viewModel: OnboardingViewModelType
    
    init(viewModel: OnboardingViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        viewModel.startLogin()
    }
    
    
    @IBAction func skipLogin(_ sender: Any) {
        viewModel.skipLogin()
    }
}
