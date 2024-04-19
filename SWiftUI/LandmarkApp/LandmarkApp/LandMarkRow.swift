//
//  LandMarkRow.swift
//  LandmarkApp
//
//  Created by Ahmed Naguib on 11/03/2024.
//

import SwiftUI

struct LandMarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)
            Text(landmark.name)
            Spacer()
            Image(systemName: landmark.isFavorite ? "star.fill" : "star")
                .imageScale(.medium)
                .foregroundColor(landmark.isFavorite ? .yellow : .gray)
        }
    }
}

#Preview {
    LandMarkRow(landmark: landmarks[0])
}
