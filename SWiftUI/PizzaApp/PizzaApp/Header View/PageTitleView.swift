//
//  PageTitleView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct PageTitleView: View {
    var title = ""
    var body: some View {
        
        Text(title).font(.largeTitle)
    }
}


struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView()
    }
}
