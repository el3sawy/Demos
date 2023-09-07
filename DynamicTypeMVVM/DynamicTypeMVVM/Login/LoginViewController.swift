//
//  LoginViewController.swift
//  DynamicTypeMVVM
//
//  Created by Ahmed Elesawy on 13/02/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: BindingTextField!
    @IBOutlet weak var userNameTextField: BindingTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindTextFields()
        
        
        viewModel.buttonIsEnable.subscribe { value in
            self.loginButton.backgroundColor =  value ? .green : .red
            
        }
    }
    
     func setBindTextFields() {
        passwordTextField.bind { [weak self] value in
            self?.viewModel.password.value = value
        }
        
        userNameTextField.bind { [weak self] value in
            self?.viewModel.userName.value = value
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        viewModel.checkIfButtonEnable()
    }
    

}
