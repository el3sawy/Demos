//
//  MyClass.swift
//  TestTextFileds
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import Foundation

class MyClass {
    private static var allInstances = 0
    private let instance: Int
    
    init() {
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit {
        print(">> MyClass.deinit #\(instance)")
    }
    func methodOne() {
        print(">> methodOne")
    }
    func methodTwo() {
        print(">> methodTwo")
    }
}
