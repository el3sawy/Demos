//
//  FixedSizeExampleiew.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 06/04/2022.
//

import SwiftUI

struct FixedSizeExampleiew: View {
    var body: some View {
        Text("Very long text here you get what i mena")
            .font(.title)
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: 100, height: 100, alignment: .center)
//        HStack {
//                    Text("Hello World!")
//                        .font(.headline)
//                    Text("Hello World!")
//                        .font(.largeTitle)
//                        .fixedSize(horizontal: true, vertical: false)
//                    Text("Hello World!")
//                        .font(.title)
//                }.lineLimit(1)
    }
}

struct FixedSizeExampleiew_Previews: PreviewProvider {
    static var previews: some View {
        FixedSizeExampleiew()
    }
}
