//
//  ContentView.swift
//  InstagramClone
//
//  Created by Gary Tokman on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
            TabView {
                FeedListView()
                    .navigationBarHidden(true)
                    .tabItem {
                        Image(Asset.home.name)
                    }
                
                Text("Search")
                    .tabItem {
                        Image(Asset.search.name)
                    }
                Text("Reels")
                    .tabItem {
                        Image(Asset.reels.name)
                    }
                Text("Shopping")
                    .tabItem {
                        Image(Asset.shop.name)
                    }
                Text("Profile")
                    .tabItem {
                        Image(Asset.meTab.name)
                    }
            }
//            .font(.headline)
            .background(Color.red)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
