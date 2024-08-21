//
//  OverlayPreferenceBackgroundDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI
//https://vimeo.com/479376622
struct OverlayPreferenceBackgroundDemo: View {
    var body: some View {
        VStack {
            Text("Ahmed Naguib HIIIII" )
                .padding()
                
                .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds, transform: { $0 })
                .anchorPreference(key: PointPreferenceKey.self, value: .center, transform: { $0 })
        }
        .backgroundPreferenceValue(PointPreferenceKey.self) { pref in
            Circle()
                .fill(.red)
        }
        .backgroundPreferenceValue(BoundsPreferenceKey.self) { pref in
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
            // OR
//            GeometryReader { geometry in
//                if let pref {
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(.gray)
//                        .frame(
//                            width: geometry[pref].width,
//                            height: geometry[pref].height
//                        )
//                        .offset(
//                            x: geometry[pref].origin.x,
//                            y: geometry[pref].origin.y
//                        )
//                    
//                } else {
//                    EmptyView()
//                }
//            }
        }
    }
}

#Preview {
    OverlayPreferenceBackgroundDemo()
}


struct PointPreferenceKey: PreferenceKey {
    typealias Value = Anchor<CGPoint>?
    
    static var defaultValue: Value = nil
    
    static func reduce(
        value: inout Value,
        nextValue: () -> Value
    ) {
        value = nextValue()
    }
}
