//
//  ListHeaderView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct ListTitleView: View {
    var title = "Ahmed"
    var body: some View {
        HStack {
            Text(title).padding(.leading, 15)
            Spacer()
        }.overlay(
            Image(systemName: "star.circle")
                .font(.largeTitle)
                .padding()
            , alignment: .trailing
            
        )
        
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListTitleView()
    }
}
