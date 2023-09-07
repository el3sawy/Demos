//
//  LoginviewModel.swift
//  DynamicTypeMVVM
//
//  Created by Ahmed Elesawy on 13/02/2022.
//

import Foundation

class LoginViewModel {
    var userName = Dynamic("")
    var password = Dynamic("")
    var buttonIsEnable = Dynamic(false)
    
    init() {
        checkIfButtonEnable()
       
        
       [userName, password].forEach({
            $0.subscribe { _ in
                self.checkIfButtonEnable()
            }
        })
    }
    
     func checkIfButtonEnable() {
        buttonIsEnable.value = (!userName.value.isEmpty && !password.value.isEmpty)
    }
}
