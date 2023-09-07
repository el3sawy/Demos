//
//  TabViewDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 27/07/2023.
//

import SwiftUI

struct TabViewDemo: View {
    var body: some View {
        TabView {
            
            ListProductView()
                .tabItem {
                    Text("All")
                }
            
            ListFavProductView()
                .tabItem {
                    Text("Fav")
                }
        }
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
