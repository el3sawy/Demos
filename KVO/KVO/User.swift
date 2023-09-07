//
//  User.swift
//  KVO
//
//  Created by Ahmed Elesawy on 27/02/2022.
//

import Foundation

class User: NSObject {
    @objc dynamic var name = String()
    // workaround 
//    @objc  var name = String()
    @objc dynamic var age: Int = 0
        
}
