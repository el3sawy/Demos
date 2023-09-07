//
//  BevelText.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 11/06/2022.
//

import SwiftUI

struct BevelText: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Text(text)
            .frame(width: width, height: height)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.element)
                        .topLeftShadow()
                    Capsule()
                        .inset(by: 3)
                        .fill(Color.element)
                        .bottomRightShadow(radius: 3, offset: 1)
                }
            )
    }
}

//struct BevelText_Previews: PreviewProvider {
//    static var previews: some View {
//        BevelText()
//    }
//}

struct Previews_BevelText_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
