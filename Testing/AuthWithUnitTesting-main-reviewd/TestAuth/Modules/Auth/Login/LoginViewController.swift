//
//  LoginViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit

// try to use swiftlint to enhance your code formatting and styling

protocol LoginViewProtocol: AnyObject { // why NSObject??
    func successLogin(user: UserModel)
    func showMessage(_ message: String)
}
class LoginViewController: UIViewController {
    
    @IBOutlet private weak var txtEmail: UITextField! // do not use shortcuts in variables names like "txt"
    @IBOutlet private weak var txtPassword: UITextField!
    
    var presenter: LoginPresenterProtocol!
    
    override func viewDidLoad() { // no need for un used ViewDidLoad(), remove it, please
        super.viewDidLoad()
    }
    
    //MARK:- Actions
    @IBAction func btnLoginTapped(_ sender: Any) { // make the @IBAction private alwyes
        presenter.login(email: txtEmail.text, password: txtPassword.text)
    }
    
    @IBAction func btnCreateAccountTapped(_ sender: Any) {
        let vc = AuthConfigurator.setVC(type: .register) // you need to add coordinator layer or routing layer, and that layer should be responsable for creating the view controllers with the help of the configurator and apply the navigation
        push(vc)
    }
}

//MARK:- Extensions

extension LoginViewController: LoginViewProtocol {
    func successLogin(user: UserModel) {
        let vc = AuthConfigurator.setVC(type: .home(user: user.name))
        push(vc)
    }
    
    func showMessage(_ message: String) {
        showAlert(message: message)
    }
}
