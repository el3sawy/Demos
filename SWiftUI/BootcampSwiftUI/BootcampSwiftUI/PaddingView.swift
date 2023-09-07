//
//  PaddingView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 12/12/2022.
//

import SwiftUI

struct PaddingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Titile")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.bottom, 5)
            Text("Ahmed Naguib Ahmed Naguib  Ahmed Naguib  Ahmed Naguib  Ahmed Naguib  Ahmed Naguib  Ahmed Naguib  Ahmed Naguib Ahmed Naguib ")
        }
        
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.4)
                               , radius: 10, x: 0, y: 10)
        )
        
       
    }
}

struct PaddingView_Previews: PreviewProvider {
    static var previews: some View {
        PaddingView()
    }
}
