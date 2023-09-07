//
//  ContentView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ContentHeaderView()
                .frame(height: 200)
                .background(Color.blue)
            PageTitleView(title: "Order Pizza")
            MenuListView()
            OrderListView()
            Spacer()
        }.padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
