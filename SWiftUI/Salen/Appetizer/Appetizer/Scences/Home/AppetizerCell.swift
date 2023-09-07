//
//  AppetizerCell.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import SwiftUI

struct AppetizerCell: View {
    let appetizer: AppetizerModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            RemoteImage(url: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(15)
            
            VStack(alignment :.leading, spacing: 10) {
                Text(appetizer.name)
                    .font(.body)
                    .fontWeight(.regular)
                Text("$\(appetizer.price, specifier: "%0.2f")")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizer: AppetizerMockData.sampleItem)
    }
}
