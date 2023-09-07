//
//  MenuItemView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct MenuItemView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image("two").resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .center, spacing: 5) {
                Text("Menu Items ")
                HStack {
                    ForEach(0..<4) { _ in
                        Image(systemName: "star.circle")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                    }
                    
                }
            }
            Spacer()
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
    }
}
