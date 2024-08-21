//
//  AcceblityDemo.swift
//  PLAY
//
//  Created by Mac on 17/08/2024.
//

import SwiftUI

struct AcceblityDemo: View {
    @State var isSelected: Bool = false
    var body: some View {
        VStack{
            longPress
            Image("bk", label: Text("Background"))
            HStack {
                Text("Error")
                Image(decorative: "error")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Image(systemName: "exclamationmark.triangle.fill")
                .accessibilityHidden(true)
        }
    }


    var longPress: some View {
        HStack {
            Text("Long Press here")
            LongPressCheckmark(isSelected: $isSelected)
                .accessibilityRepresentation {
                    Toggle(isOn: $isSelected) {
                        Text("Checkmark")
                    }
                }
        }
    }
}

struct LongPressCheckmark: View {
    @Binding var isSelected: Bool

    var body: some View {
        Image(systemName: isSelected ? "checkmark.rectangle" : "rectangle")
            .onLongPressGesture { isSelected.toggle() }
    }
}

#Preview {
    AcceblityDemo()
}
