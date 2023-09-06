//
//  RegisterViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit
protocol RegisterViewProtocol: NSObject {
    func didSuccessAddUser()
    func showMessage(_ message: String)
}

class RegisterViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet private weak var txtName: UITextField!
    @IBOutlet private weak var txtMobile: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    @IBOutlet private weak var txtEmail: UITextField!
    
    var presenter: RegisterPresenterProtocol!
    //MARK:- Life cycle
    override func viewDidLoad() { // Empty ViewDidLoad
        super.viewDidLoad()
    }
    
    //MARK:- Actions
    @IBAction func btnRegisterTapped(_ sender: Any) {
       var user = UserInputFormModel()
        user.name = txtName.text
        user.email = txtEmail.text
        user.password = txtPassword.text
        user.phone = txtMobile.text
        presenter.register(user: user)
    }
}

//MARK:- Extensions
extension RegisterViewController: RegisterViewProtocol {
    func didSuccessAddUser() {
        let vc = AuthConfigurator.setVC(type: .home(user: txtName.text ?? ""))
        push(vc)
    }
    
    func showMessage(_ message: String) {
        showAlert(message: message)
    }
}
