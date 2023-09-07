//
//  LocalStorage.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import Foundation

final class LocalStorage {
    
    static let shared = LocalStorage()
    private let userDefault = UserDefaults.standard
    private let key = "Login.user"
    private init() {
        
    }
   
    
    func setLogin(value: Bool) {
        userDefault.set(value, forKey: key)
    }
    
    var isLogin: Bool {
        userDefault.bool(forKey: key)
    }
}
