 //
//  LocalStorage.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation
import RealmSwift

protocol LocalStorageProtocol {
    func save(object: WeatherListVM)
    func searchBy(key: String) -> WeatherListVM?
}

class LocalStorage: LocalStorageProtocol {
    
    private var realm: Realm
    init() {
        do{
            self.realm = try Realm()
        }catch {
            print(error)
            fatalError()
        }
    }
    
    func save(object: WeatherListVM) {
        do {
            try realm.write {
                realm.add(object, update: .all)
            }
        
        }catch {
            print(error)
        }
    }
    
    func searchBy(key: String) -> WeatherListVM? {
       let x =  realm.object(ofType: WeatherListVM.self, forPrimaryKey: key)
        return x
    }
}
