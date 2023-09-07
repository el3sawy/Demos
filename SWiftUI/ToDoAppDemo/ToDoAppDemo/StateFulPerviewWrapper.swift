//
//  StateFulPerviewWrapper.swift
//  ToDoAppDemo
//
//  Created by NTG on 13/08/2023.
//

import SwiftUI

struct StateFullPreviewWrapper<Value, Content: View>: View {

    @State var value: Value
    var content: (Binding<Value>) -> Content
   
    var body: some View {
        content($value)
    }
    
    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
