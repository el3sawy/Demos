//
//  UserModel.swift
//  Models
//
//  Created by Ahmed Elesawy on 15/08/2022.
//

import Foundation

public struct UserModel {
    
    let name: String
    let address: String
    
    public init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}
