//
//  OverlayPreferenceDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI
//https://swiftwithmajid.com/2020/03/18/anchor-preferences-in-swiftui/
struct OverlayPreferenceOverlayDemo: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("Hello World !!!")
                .anchorPreference(
                    key: BoundsPreferenceKey.self,
                    value: .bounds
                ) { $0 }
        }
        .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
            
            GeometryReader { geometry in
                preferences.map { value in
                    Rectangle()
                        .stroke()
                        .frame(
                            width:  geometry[value].width,
                            height: geometry[value].height
                        )
                        .offset(
                            x: geometry[value].minX,
                            y: geometry[value].minY
                        )
                }
            }
        }
    }
    
    
}

#Preview {
    OverlayPreferenceOverlayDemo()
}

struct BoundsPreferenceKey: PreferenceKey {
    typealias Value = Anchor<CGRect>?
    
    static var defaultValue: Value = nil
    
    static func reduce(
        value: inout Value,
        nextValue: () -> Value
    ) {
        value = nextValue()
    }
}
