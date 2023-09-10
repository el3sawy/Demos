//
//  KeyValueWrapper.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import Foundation

protocol StorageKey {
    var rawValue: String { get }
}

enum OnboardingStorageKey: String, StorageKey {
case userDidSetLoading
}

protocol KeyValueWrapper {
    func setObject<T>(_ object: T, forKey: StorageKey)
    func getObject<T>(forKey: StorageKey) -> T?
    
    func setCodableObject<T: Encodable>(_ object: T, forKey: StorageKey)
    func getCodableObject<T: Decodable>(forKey: StorageKey) -> T?
}

extension UserDefaults: KeyValueWrapper {
    func setObject<T>(_ object: T, forKey: StorageKey) {
        setValue(object, forKey: forKey.rawValue)
    }
    
    func getObject<T>(forKey: StorageKey) -> T? {
        value(forKey: forKey.rawValue) as? T
    }
    
    func setCodableObject<T: Encodable>(_ object: T, forKey: StorageKey) {
        do {
            let data = try JSONEncoder().encode(object)
            setValue(data, forKey: forKey.rawValue)
        } catch {
            print("Logger ")
        }
    }
    
    func getCodableObject<T: Decodable>(forKey: StorageKey) -> T? {
        guard let data: Data = getObject(forKey: forKey) else {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch {
            print("Logger ")
            return nil
        }
    }
}


func useIt() {
   
    UserDefaults.standard.setObject("", forKey: OnboardingStorageKey.userDidSetLoading)
}
