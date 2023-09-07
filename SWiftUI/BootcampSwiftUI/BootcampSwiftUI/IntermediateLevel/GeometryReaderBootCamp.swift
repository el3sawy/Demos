//
//  GeometryReaderBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 17/04/2023.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.70)
                
                Rectangle()
                    .fill(Color.blue)
                    
            }
            .ignoresSafeArea()
        }
    }
}

struct GeometryReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootCamp()
    }
}
