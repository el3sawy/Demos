//
//  ToolbarBackgroundDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 09/08/2024.
//

import SwiftUI

struct ToolbarBackgroundDemo: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("toolbarBackground")
            }
            .navigationTitle("HOOOO")
            .toolbarBackground(Color.red, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ToolbarBackgroundDemo()
}
