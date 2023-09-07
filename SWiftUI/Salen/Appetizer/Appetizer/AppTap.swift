//
//  AppTap.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 09/01/2022.
//

import SwiftUI

struct AppTap: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.square.fill")
                    Text("Account")
                }
        }.accentColor(Color("MainGreen"))
            
    }
}

struct AppTap_Previews: PreviewProvider {
    static var previews: some View {
        AppTap()
    }
}
