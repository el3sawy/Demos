//
//  OrderListView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct OrderListView: View {
    var body: some View {
        VStack {
            ListTitleView(title: "Your Order ")
            List(0..<5) { _ in
                OrderView()
            }
            Spacer()
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
