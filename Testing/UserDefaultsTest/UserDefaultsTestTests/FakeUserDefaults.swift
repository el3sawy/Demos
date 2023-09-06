//
//  FakeUserDefaults.swift
//  UserDefaultsTestTests
//
//  Created by Ahmed Elesawy on 13/01/2022.
//

import Foundation
@testable import UserDefaultsTest

class FakeUserDefaults: UserDefaultsProtocol {
    var integers: [String: Int] = [:] {
        didSet {
            print("=========")
            print(integers)
        }
    }
    func set(_ value: Int, forKey defaultName: String) {
        print(value)
        print(defaultName)
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        return integers[defaultName] ?? 0
    }
}
