//
//  DataBase.swift
//  Singlaton
//
//  Created by Ahmed Elesawy on 01/01/2022.
//

import Foundation

public class Database {
    static let shared = Database()
    private var dic: [String: String] = [:]
    private init() {}
    
    func addValue(_ value: String, key: String) {
        dic[key] = value
    }
    
    func getValue(_ key: String) -> String? {
        dic[key]
    }
    
    func removeValue(_ key: String) {
        dic.removeValue(forKey: key)
    }
    
    func count() -> Int {
        dic.count
    }
    
    func reset() {
        dic = [:]
    }
}
