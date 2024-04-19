//
//  LandMarkDetails.swift
//  LandmarkApp
//
//  Created by Ahmed Naguib on 11/03/2024.
//

import SwiftUI

struct LandMarkDetails: View {
    @Binding var modelData: Landmark
    
    var body: some View {
        VStack {
            FavouritButton(isSet: $modelData.isFavorite)
        }
    }
}

#Preview {
    LandMarkDetails(modelData: .constant(landmarks[0]))
}
