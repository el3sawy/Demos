//
//  TabViewEx.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 11/04/2022.
//

import SwiftUI

struct TabViewEx: View {
    var body: some View {
        TabView {
            Text("Tab 1").tabItem {
                Image(systemName: "phone")
                Text("Call")
            }
            Counter().tabItem {
                Text("Count")
            }
            Text("Tab 1111").tabItem {
                Image(systemName: "phone.arrow.up.right")
                Text("Call")
            }
            
        }
        .padding()
    }
}

struct TabViewEx_Previews: PreviewProvider {
    static var previews: some View {
        TabViewEx()
    }
}
