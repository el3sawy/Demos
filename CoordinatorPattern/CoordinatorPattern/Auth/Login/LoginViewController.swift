//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by NTG on 19/06/2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private let viewModel: LoginViewModelType
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        viewModel.performSignIn()
    }
}
