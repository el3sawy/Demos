//
//  OrderView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        HStack {
            Text("Your Order item here")
            Spacer()
            Text("100$")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
