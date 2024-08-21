//
//  SortPrioritydemo.swift
//  SwiftUIAccessibility
//
//  Created by Mac on 17/08/2024.
//

import SwiftUI

struct SortPrioritydemo: View {
@State var isToggle = false
    @State var value = 3
    var body: some View {
        VStack{

            Toggle(isOn: $isToggle) {
                Text("Send me updates")
            }
            VStack {
               Text("Read this last")
                  .accessibility(sortPriority: 0)
               Text("Read this first")
                  .accessibility(sortPriority: 2)
               Text("Read this second")
                  .accessibility(sortPriority: 1)
            }

            HStack {
               Button(action: {
                  self.value -= 1
               }) {
                  Text("Decrease")
               }
               .accessibility(sortPriority: 1)
               Text(String(value))
                  .accessibility(sortPriority: 2)
               Button(action: {
                  self.value += 1
               }) {
                  Text("Increase")
               }
            }
        }
//        .accessibilityElement(children: .contain)
    }
}

#Preview {
    SortPrioritydemo()
}
