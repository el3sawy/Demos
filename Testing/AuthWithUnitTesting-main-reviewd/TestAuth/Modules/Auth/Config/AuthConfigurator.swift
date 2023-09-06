//
//  Authonfigurator.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import Foundation
import UIKit

enum AuthConfiguratorType {
    case login
    case register
    case home(user: String)
}
struct AuthConfigurator {
    
    static func setVC(type: AuthConfiguratorType) -> UIViewController { // This funciton if setting nothing, why we name it setVC(), also do not use shortcust in variable naming
        
        switch type {
        
        case .login:
            return login()
        case .register:
            return register()
        case .home(user: let user):
            return home(user: user)
        }
    }
    
    private static func register() -> UIViewController {
        let localStorage = LocalStorage()
        let repo = AuthRepository(localStorage: localStorage)
        let view = RegisterViewController()
        let validator = Validations()
        let presenter = RegisterPresenter(view: view, repo: repo, validator: validator)
        view.presenter = presenter
        return view
    }
    
    private static func login() -> UIViewController {
        let localStorage = LocalStorage()
        let repo = AuthRepository(localStorage: localStorage)
        let view = LoginViewController()
        let validator = Validations()
        let loginPrecess = LoginProcess()
        let presenter = LoginPresenter(view: view, repo: repo, loginProcess: loginPrecess, validator: validator)
        view.presenter = presenter
        return view
    }
    
    private static func home(user name: String) -> UIViewController {
        return HomeViewController(name: name)
    }
}
