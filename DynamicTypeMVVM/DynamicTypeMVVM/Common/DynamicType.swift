//
//  DynamicType.swift
//  DynamicTypeMVVM
//
//  Created by Ahmed Elesawy on 13/02/2022.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(callBack:  @escaping Listener) {
        self.listener = callBack
    }
}
