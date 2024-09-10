//
//  SafeAreaInsetDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 20/08/2024.
//

import SwiftUI

struct SafeAreaInsetDemo: View {
    var body: some View {
            List(0..<10) { _ in
                Rectangle()
                    .fill(.red)
                    .frame(height: 120)

            }
            .padding(.top, 40)
            .listStyle(.plain)
            .controlSize(.mini)
            .safeAreaInset(edge: .top) {
                Text("Pinned Header")
            }
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: nil) {

                HStack {
                    Text("Counter")
                    Text("Name")
                }
                .frame(maxWidth: .infinity)
                .background(.yellow)
            }
    }
}

#Preview {
    SafeAreaInsetDemo()
}
