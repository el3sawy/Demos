//
//  SwipActionDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 24/07/2023.
//

import SwiftUI

struct SwipActionDemo: View {
    var body: some View {
        List {
            Text("Ahmed ")
                .swipeActions {
                    Button(role: .destructive) {
                        print("HII")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
            
            
            Text("Ko ko")
                .swipeActions(edge: .leading) {
                    Button {
                        print("HII")
                    } label: {
                        Label("Delete", systemImage: "pin") 
                    }
                    .tint(.orange)
                }
        }
    }
}

struct SwipActionDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwipActionDemo()
    }
}
