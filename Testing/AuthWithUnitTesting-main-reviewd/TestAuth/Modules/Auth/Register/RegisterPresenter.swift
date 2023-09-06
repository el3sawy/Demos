//
//  RegisterPresenter.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import Foundation
protocol RegisterPresenterProtocol {
    func register(user: UserInputFormModel)
}

class RegisterPresenter: RegisterPresenterProtocol {
    // MARK: - Dependencies
    private var repo: AuthRepositoryProtocol
    private weak var view: RegisterViewProtocol?
    private var validator: ValidationsProtocol
  
    // MARK: - Initializers
    init(view: RegisterViewProtocol, repo: AuthRepositoryProtocol, validator: ValidationsProtocol) {
        self.repo = repo
        self.view = view
        self.validator = validator
    }
    
    func register(user: UserInputFormModel) {
        guard let userModel = validation(user: user) else {return}
        repo.addNewUser(userModel) { [weak self] response in
            guard let self = self else {return}
            
            switch response {
            case .success(_):
                self.view?.didSuccessAddUser()
            case .failure(let error):
                self.view?.showMessage(error.description)
            }
        }
    }
    
    private func validation(user: UserInputFormModel) -> UserModel? {
        do {
           try validator.name(value: user.name)
            try validator.mobile(value: user.phone)
            try validator.email(value: user.email)
            try validator.password(value:  user.password)
            let userModel = UserModel(user: user)
            return userModel
        }catch(let error) {
            guard let authError = error as? AuthErrorEnum else {return nil}
            self.view?.showMessage(authError.description)
            return nil
        }
    }
}
