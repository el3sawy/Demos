//
//  LoginProcess.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 30/07/2021.
//

import Foundation
protocol LoginProcessProtocol {
    func login(_ response: AppResponse<UserModel>, password: String) -> AppResponse<UserModel>
}

class LoginProcess: LoginProcessProtocol {
   private var password: String = ""
    func login(_ response: AppResponse<UserModel>, password: String) -> AppResponse<UserModel>  {
        self.password = password
        return handleLoginResponse(response)
    }
    
    private func handleLoginResponse(_ response: AppResponse<UserModel>) -> AppResponse<UserModel> {
        
        switch response {
        
        case .success(let user):
            let result = checkIsMailAndPasswordIsCorrect(user: user)
            guard result  else {
                return AppResponse.failure(.invalidUser)
            }
            return AppResponse.success(user)
        case .failure(_):
            return AppResponse.failure(.userNotFound)
        }
    }
    
    private func checkIsMailAndPasswordIsCorrect(user: UserModel) -> Bool {
        let userModel = UserModel()
        userModel.password = password
        if userModel == user {
            return true
        }else {
            return false
        }
    }
}
