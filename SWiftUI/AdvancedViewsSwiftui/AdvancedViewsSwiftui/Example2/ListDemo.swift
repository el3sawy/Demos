//
//  ListDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 14/08/2024.
//

import SwiftUI

struct ListDemo: View {
    var body: some View {
        List {
            Text("Ahmed")
            Text("Ahmed")
                .listRowSeparator(.hidden)
            Text("Ahmed")
                .listRowSeparator(.hidden)
            Text("Ahmed")
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListDemo()
}
