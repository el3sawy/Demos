//
//  ContentView.swift
//  PlayNavigation
//
//  Created by Ahmed Naguib on 11/02/2024.
//

import SwiftUI


struct DetailsView: View {
    private let text: String
    
    init(text: String) {
        self.text = text
//        print(text)
    }
    var body: some View {
        Text(text)
            
    }
}



struct ContentView: View {
    @State var test: [String] = []
    var body: some View {
        NavigationStack(path: $test) {
            
        }
        NavigationView {
            ScrollView {
               VStack(spacing: 30) {
                    ForEach(0..<3) { i in
                        
                        
                        
                        NavigationLink("Index \(i)") {
                            DetailsView(text: "Index \(i)")
                        }
                    }
                }
//                .navigationTitle("Navigation Demo")
            }
        }
    }
}

#Preview {
    ContentView()
}

