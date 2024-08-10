//
//  ContextMenuView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 08/08/2024.
//

import SwiftUI

struct ContextMenuView: View {
    var body: some View {
        
        
       VStack {
            Text("Long press")
            
                .contextMenu {
                    Button {
                        print("Change country setting")
                    } label: {
                        Label("Choose Country", systemImage: "globe")
                    }

                    Button {
                        print("Enable geolocation")
                    } label: {
                        Label("Detect Location", systemImage: "location.circle")
                    }
                }
        }
    }
}

#Preview {
    ContextMenuView()
}
