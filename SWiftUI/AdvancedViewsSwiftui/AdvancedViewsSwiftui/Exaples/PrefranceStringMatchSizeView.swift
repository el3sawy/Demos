//
//  PrefranceStringMatchSizeView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI

struct PrefranceStringMatchSizeView: View {
    let arr = ["Ahmed", "Ali", "Eleesawy", "Ahmed Naguiddddddb", "KOKO", "Ahmed Naguiddddddbddd"]
    @State var maxWidth: CGFloat = 20
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Text("Ahmed Naguiddddddb")
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                       
                    
                        .background(.red)
                    Text("22")
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                        .background(.green)
                }
                HStack {
                    Text("Ahmed")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .background(.red)
                    Text("22eeeee")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                        .background(.green)
                }
            }
            .padding(.horizontal, 20)
            
            
            
            ForEach(arr, id: \.self) { name in
                HStack(spacing: 15) {
                    Text(name)
                        .lineLimit(1)
                        .overlay(
                            GeometryReader { geometry in
                                
                                Color.green.maxViewWidth(geometry.frame(in: .local).width)
                            }
                        )
                }
            }
            Rectangle()
                .fill(Color.blue)
                .frame(width: maxWidth, height: 2)
                .padding()
        }
        .onPreferenceChange(PreferenceKeyMaxWidth.self) { newValue in
            let _ = print(newValue)
            maxWidth = newValue
        }
    }
}

#Preview {
    PrefranceStringMatchSizeView()
}

struct PreferenceKeyMaxWidth: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = max(value, nextValue())
    }
}

extension View {
    func maxViewWidth(_ value: CGFloat) -> some View {
        self.preference(key: PreferenceKeyMaxWidth.self, value: value)
    }
}
