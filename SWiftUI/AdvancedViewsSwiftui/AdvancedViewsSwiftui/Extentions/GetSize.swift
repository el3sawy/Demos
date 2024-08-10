//
//  GetSize.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 08/08/2024.
//

import SwiftUI

extension View {
    func getSize(size: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
                    .onAppear {
                        size(geometry.size)
                    }
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: size)
    }
}

struct SizePreferenceKey: PreferenceKey {
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        
    }
    
    static var defaultValue: CGSize = .zero
}
