//
//  tabBarView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 10/04/2023.
//

import SwiftUI

struct tabBarView: View {
    @State var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            
            TabBarViewHomePage(selectedIndex: $selectedIndex)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            
            Text("Browse")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(Color.green)
    }
}


struct TabBarViewHomePage: View {
    @Binding var selectedIndex: Int
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Button("Go to profile") {
                selectedIndex = 2
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.yellow.cornerRadius(5))
            
            
        }
    }
}

struct TabBarCustomView: View {
    
    let colors: [Color] = [.brown, .green, .blue, .yellow, .purple]
    var body: some View {
        TabView {
            ForEach(colors, id: \.self) { color in
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                
            }
        }
        .background(Color.white)
        .frame(height: 200)
        .tabViewStyle(PageTabViewStyle())
    }
}





struct TestViewq: View {
    @State var count = 0
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<50) { index in
                        RoundedRectangle(cornerRadius: 20.0)
                            .frame(height: 200)
                            .onAppear {
                                count += 1
                            }
                        
                    }
                }
            }
            .navigationTitle("Title -> \(count)")
        }
        
        
        
        
        
    }
}
// MARK: -  New View
struct tabBarView_Previews: PreviewProvider {
    static var previews: some View {
                tabBarView()
        TestViewq()
    }
}
