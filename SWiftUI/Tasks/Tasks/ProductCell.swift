//
//  ProductCell.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/04/2024.
//

import SwiftUI

struct ProductCell: View {
    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up.fill")
                .padding(5)
                .background(Color.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: -4 )
                .onTapGesture {
                    print("ssss")
                }
            Image(systemName: "square.and.arrow.up.fill")
                
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .padding()
    }
}

#Preview {
    ProductCell()
}
