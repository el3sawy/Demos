//
//  HorizontallyAlignedLabelStyle.swift
//  KuchiApp
//
//  Created by Ahmed Elesawy on 15/06/2022.
//

import SwiftUI

struct HorizontallyAlignedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            configuration.title
            configuration.icon
        }
    }
    
    
}
