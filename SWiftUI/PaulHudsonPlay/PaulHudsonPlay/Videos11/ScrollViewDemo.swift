//
//  ScrollViewDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 21/07/2023.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100) { index in
                    Text("Index \(index)")
                }
            }
            .frame(maxWidth: .infinity)
        }
       
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}
