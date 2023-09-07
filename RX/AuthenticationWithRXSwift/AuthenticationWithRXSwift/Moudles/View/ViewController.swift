//
//  ViewController.swift
//  AuthenticationWithRXSwift
//
//  Created by Ahmed Elesawy on 04/10/2021.
//

import UIKit
import RxSwift
import os.log
class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var messageLable: UILabel!
    var viewModel = LoginViewModel()
    let disPose = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let input = LoginViewModel.Input(userName: userNameTextField.rx.text.orEmpty.as, password: passwordTextField.rx.text.orEmpty.asObservable(), buttonLoginTapped: loginButton.rx.tap.asObservable())
//
//        let output = viewModel.transform(input)
//        output.loginButtonEnabled.drive(loginButton.rx.valid).disposed(by: disPose)
//        output.messageText.drive(messageLable.rx.text).disposed(by: disPose)
//        output.messageEmpty.drive(messageLable.rx.isHidden).disposed(by: disPose)
    }
    private func bindTestFields() {
//        passwordTextField.rx.text.bind(to: viewModel.)
    }
    
}
extension Reactive where Base : UIButton {
    public var valid : Binder<Bool> {
        return Binder(self.base) { button, valid in
            button.isEnabled = valid
            button.alpha = valid ? 1 : 0.5
        }
    }
}
