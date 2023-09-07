//
//  Binding+.swift
//  ToDoAppDemo
//
//  Created by NTG on 14/08/2023.
//

import SwiftUI

extension Binding {
    
    func whenEmpty <Wrapped>(_ defaultValue: Wrapped) -> Binding<Wrapped> where Value == Wrapped? {
        Binding<Wrapped>(
            get: {wrappedValue ?? defaultValue },
            set: { wrappedValue = $0  })
    }
     
    func onValue(_ sideEffect: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {wrappedValue},
            set: {
                wrappedValue = $0
                sideEffect()
            })
    }
}
