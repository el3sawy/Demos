//
//  LoginViewController.swift
//  CombineUnitTest
//
//  Created by NTG on 10/07/2023.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var btn: UIButton!
    private var cancellables = Set<AnyCancellable>()
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindTextFieldsChanges()
        
        viewModel.isButtonEnabledPublisher.sink { value in
            print(value)
        }
        .store(in: &cancellables)

        
    }
    
    func bindTextFieldsChanges() {
        emailText.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    @objc func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }

        if sender == emailText {
            viewModel.emailPublisher = text
        } else if sender == passwordText {
            viewModel.passwordPublisher = text
        }
    }

}
