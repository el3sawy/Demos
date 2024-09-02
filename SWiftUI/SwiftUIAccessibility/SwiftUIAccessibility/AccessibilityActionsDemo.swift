//
//  AccessibilityActionsDemo.swift
//  SwiftUIAccessibility
//
//  Created by Mac on 17/08/2024.
//

import SwiftUI

struct AccessibilityActionsDemo: View {
    @State var name = false

    var body: some View {
        VStack {
            Text(verbatim: "Ahmed")
            Text(verbatim: "KOKO")
            Text(verbatim: "Aki")
            Text(name ? "Ahmed" : "KOKO")
                .foregroundStyle(.red)
                .minimumScaleFactor(0.8)

        }
        .accessibilityElement(children: .combine)
        .accessibilityValue(name ? "ON " : "Off")
        .accessibilityAction {
//            name.toggle()
           VStack {
                Button {
                                // Perform first action here
                            } label: {
                                Text("First Action")
                            }
                            Button {
                                // Perform second action here
                            } label: {
                                Text("Second Action")
                            }
            }
        }
        .accessibility(label: Text(" Change name"))
//        .accessibilityAddTraits(.isModal)
    }
}

#Preview {
    AccessibilityActionsDemo()
}
