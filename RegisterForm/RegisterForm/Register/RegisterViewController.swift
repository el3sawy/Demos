//
//  RegisterViewController.swift
//  RegisterForm
//
//  Created by Ahmed Elesawy on 20/09/2022.
//

import UIKit
import Combine
import TimelaneCombine
//https://betterprogramming.pub/uikit-mvvm-combine-912c80c02262
class RegisterViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var passwordAginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var signupButon: UIButton!
    
    @IBOutlet weak var lbl: UILabel!
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    private let viewModel = RegisterViewModel()
   
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFiled()
        bindButton()
        viewModel.name
            .lane("Raw search query")
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .lane("Search query", filter: [.event])
            .map {
                return $0
            }
            .assign(to: \.text, on: lbl)
            .store(in: &subscriptions)
    }
    
    // MARK: - Functions
    private func bindTextFiled() {
        subscriptions = [
            nameTextField.bind(viewModel.name),
            emailTextField.bind(viewModel.email),
            passwordTextField.bind(viewModel.password),
            passwordAginTextField.bind(viewModel.reenterPassword)
        ]
    }
    
    private func bindButton() {
        viewModel.$isEnableButton
            .map { $0 ? UIColor.green : UIColor.gray }
            .assign(to: \.backgroundColor, on: signupButon)
            .store(in: &subscriptions)
        
        viewModel.$isEnableButton.assign(to: \.isEnabled, on: signupButon)
            .store(in: &subscriptions)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Welcome", message: "Welcome man", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
