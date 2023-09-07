//
//  MenuListView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct MenuListView: View {
    var body: some View {
        VStack {
            ListTitleView(title: "Menu")
            List(0 ..< 5) { _ in
                MenuItemView()
            }
            Spacer()
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
