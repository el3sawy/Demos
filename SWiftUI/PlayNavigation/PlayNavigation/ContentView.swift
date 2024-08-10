//
//  ContentView.swift
//  PlayNavigation
//
//  Created by Ahmed Naguib on 11/02/2024.
//

import SwiftUI


struct DetailsView: View {
    @EnvironmentObject var router: NavigationRouter
   
    var body: some View {
        VStack  {
            
            Button("ss") {
                router.reset()
            }
        }
            
    }
}



struct ContentView: View {
    @State var test: [String] = []
    var body: some View {
        NavigationView{
            VStack {
                
                NavigationLink("Test") {
                    DetailsView()
                }

                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

