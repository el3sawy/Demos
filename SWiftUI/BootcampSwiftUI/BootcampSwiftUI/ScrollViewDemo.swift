//
//  ScrollViewDemo.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 16/12/2022.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        
        ScrollView {
        
            LazyVStack{
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        ForEach(0..<10) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                            //                        .frame(maxWidth: .infinity, idealHeight: 100)
                                .frame(width: UIScreen.main.bounds.width ,height: 200)
                                .overlay(
                                    Text("Item number is  \(index)")
                                )
                        }
                    }
                }
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(0..<10) { index in
                        LazyVStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .frame(height: 100)
                                .overlay(
                                    Text("Item number is  \(index)")
                                )
                                .padding(.horizontal, 16)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}
