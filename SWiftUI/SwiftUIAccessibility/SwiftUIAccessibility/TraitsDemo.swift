//
//  TraitsDemo.swift
//  SwiftUIAccessibility
//
//  Created by Mac on 17/08/2024.
//

import SwiftUI

struct TraitsDemo: View {
    var body: some View {
        VStack {

//            Text("Ahmed KOKO")
//                .accessibilityAddTraits(.isHeader)
//            Button(action: {}, label: { Text(
//                "Sign in ") })
//            .accessibility(addTraits: [.isSelected, .playsSound])
//                .accessibility(removeTraits: .isButton)

            Button(action: {}, label: { Text("➡️✉️") })
                        .accessibility(label: Text("Send"))
        }
    }
}

#Preview {
    TraitsDemo()
}
