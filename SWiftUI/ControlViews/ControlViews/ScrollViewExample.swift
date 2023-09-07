//
//  ScrollViewExample.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 11/04/2022.
//

import SwiftUI

struct ScrollViewExample: View {
    var colors: [Color] = [
        .red, .green, .gray, .black, .blue]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(self.colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 5)
                            .fill(color)
                            .frame(width: reader.size.width - 50, height: 200)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
