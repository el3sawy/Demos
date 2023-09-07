//
//  Food.swift
//  ModernConcurrency
//
//  Created by NTG on 04/09/2023.
//

import Foundation


class Food {
    
    private var foods: [String] = []
    let queu = DispatchQueue(label: "Com.eAnd")
    func append(_ item: String) {
        queu.async(flags: .barrier) {
            self.foods.append(item)
        }
        
    }
    
    func getAll()-> [String] {
        return queu.sync {
            return foods
        }
    }
    
}

class FoodTwo {
    
    private var foods: [String] = []
    
    func append(_ item: String) {
        self.foods.append(item)
    }
    
    func getAll()-> [String] {
        
        return foods
    }
    
}



actor FoodThree {
    
    private var foods: [String] = []
    
    func append(_ item: String) {
        self.foods.append(item)
    }
    
    func getAll()-> [String] {
        
        return foods
    }
    
}
