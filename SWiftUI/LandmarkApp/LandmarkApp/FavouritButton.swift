//
//  FavouritButton.swift
//  LandmarkApp
//
//  Created by Ahmed Naguib on 11/03/2024.
//

import SwiftUI

struct FavouritButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button(action: {
            
            isSet.toggle()
        }, label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        })
    }
}

#Preview {
    FavouritButton(isSet: .constant(false))
}
