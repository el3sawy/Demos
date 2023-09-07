//
//  ImageSliderView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct ImageSliderView: View {
    var body: some View {
        
        ZStack(alignment: .center) {
            Image("one").resizable()
                .cornerRadius(10)
            Text("Pizza Name here")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .frame(height: 200)
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}
