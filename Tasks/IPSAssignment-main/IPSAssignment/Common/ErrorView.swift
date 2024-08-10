//
//  ErrorView.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 25/03/2023.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.yellow)
            Text(errorMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(12)
        }
    }
}
