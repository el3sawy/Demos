//
//  ContentView.swift
//  BuildForProd
//
//  Created by Mohab El-Shishtawy on 12/13/20.
//

import SwiftUI

#if DEBUG
struct ContentView: View {
   var body: some View {
       Text("Hello, Debug!")
           .padding()
   }
}

       #elseif STAGGING
struct ContentView: View {
   var body: some View {
       Text("Hello, Stagging!")
           .padding()
   }
}
       #else
   var body: some View {
       Text("Who are you?!")
           .padding()
   }

       #endif


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
