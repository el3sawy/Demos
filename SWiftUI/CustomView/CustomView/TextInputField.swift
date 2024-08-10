//
//  TextInputField.swift
//  CustomView
//
//  Created by NTG Clarity on 02/07/2024.
//

import SwiftUI

struct TextInputField: View {
    private var title: String
    @Binding private var text: String
    @Environment(\.clearButtonHidden) var clearButtonHidden
    init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(text.isEmpty ? Color(.placeholderText) : .accentColor)
                .offset(y: text.isEmpty ? 0 : -30)
                .scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
            TextField("", text: $text)
                .padding(.trailing, 20)
                .overlay (
                    button
                    , alignment: .trailing)
        }
        .frame(height: 44)
        .background(Color.gray.opacity(0.2))
        .animation(.spring, value: text)
        
    }
    
    @ViewBuilder
    var button: some View {
        if !clearButtonHidden {
            Image(systemName: "heart")
        } else {
            EmptyView()
        }
        
    }
}

#Preview {
    TextInputField(title: "Hiiiii", text: .constant("dddd"))
}


private struct TextInputFieldClearButton: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var clearButtonHidden: Bool {
        get { self[TextInputFieldClearButton.self] }
        set { self[TextInputFieldClearButton.self] = newValue}
    }
}


extension View {
    func clearButtonHidden(_ hide: Bool) -> some View {
        environment(\.clearButtonHidden, hide)
    }
}
