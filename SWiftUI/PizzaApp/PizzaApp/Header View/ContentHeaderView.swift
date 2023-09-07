//
//  ContentHeaderView.swift
//  PizzaApp
//
//  Created by Ahmed Elesawy on 20/11/2021.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        
        VStack {
            GeometryReader { g in
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ForEach(0..<10) { _ in
                                ImageSliderView()
                                .frame(width: g.size.width, height: 200)
                                .background(Color.red)
                        }
                    }
                   
                }.frame(height: 200)
//                .frame(width: g.size.width)
                .background(Color.orange)
                
            }
            Spacer()
        }
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
    }
}

