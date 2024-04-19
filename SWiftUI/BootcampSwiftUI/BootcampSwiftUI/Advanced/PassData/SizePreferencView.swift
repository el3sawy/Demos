//
//  SizePreferencView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 19/04/2024.
//

import SwiftUI

struct SizePreferencView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
          
    }
}

#Preview {
    SizePreferencView()
}


struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geo in
            Color
                .clear
                .preference(key: SizePreferenceKey.self, value: geo.size)
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}
