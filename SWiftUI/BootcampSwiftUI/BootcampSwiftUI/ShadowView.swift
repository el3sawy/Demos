//
//  ShadowView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

import SwiftUI

struct ShadowView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.red)
                
                .shadow(color: Color.blue, radius: 0, x: 0, y: -4)
                .frame(width: 300, height: 300)
            
        }
    }
}

struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowView()
            .preferredColorScheme(.light)
    }
}
