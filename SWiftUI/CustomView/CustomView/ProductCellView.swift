//
//  ProductCellView.swift
//  CustomView
//
//  Created by NTG Clarity on 03/07/2024.
//

import SwiftUI

enum ProductCellEvents {
    case addToCart
    case remove
}
struct ProductCellView: View {
    
    var onEvent: ((ProductCellEvents) -> Void)
    var body: some View {
       
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.red)
                .frame(width: 120, height: 120)
            
            Text("Add To Card")
                .onTapGesture {
                    onEvent(.addToCart)
                }
            
            Text("Remove")
                .onTapGesture {
                    onEvent(.remove)
                }
        }
    }
}

#Preview {
    ProductCellView { _ in
        
    }
}
