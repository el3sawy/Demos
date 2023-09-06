//
//  HomeViewController.swift
//  TestTextFileds
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private(set) var usernameField: UITextField!
    @IBOutlet private(set) var passwordField: UITextField!
    deinit {
        print("ViewController.deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == usernameField {
            return !string.contains(" ") } else {
                return true
            }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameField {
            passwordField.becomeFirstResponder()
            
        } else {
                guard let username = usernameField.text,
                      let password = passwordField.text else {
                          return false
                      }
                passwordField.resignFirstResponder()
                performLogin(username: username, password: password)
            }
        return false
        
    }
    
    private func performLogin(username: String, password: String) { print("Username: \(username)")
        print("Password: \(password)")
    }
}
