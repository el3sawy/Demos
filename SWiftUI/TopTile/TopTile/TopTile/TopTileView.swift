//
//  TopTileView.swift
//  TopTile
//
//  Created by NTG Clarity on 07/07/2024.
//

import SwiftUI

struct TopTileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("If you need help, please contact")
                .foregroundStyle(.white)
            Text("gloomikon@gmail.com")
                .foregroundStyle(.blue)
        }
        .font(.headline)
        .padding()
        .background(.black)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    TopTileView()
}
