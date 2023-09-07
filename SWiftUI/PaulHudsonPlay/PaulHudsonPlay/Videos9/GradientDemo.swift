//
//  GradientDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 15/07/2023.
//

import SwiftUI

struct GradientDemo: View {
    var body: some View {
        
        // Linear
        //        LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
        //        LinearGradient(stops:
        //                        [
        //                            .init(color: .white, location: 0.45),
        //                            .init (color: .black, location: 0.55),
        //                        ]
        //                       ,
        //                       startPoint: .top,
        //                       endPoint: .bottom)
        
        
        // Radial
        //        RadialGradient(gradient: .init(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 100)
        
        
        RadialGradient(stops: [
            .init(color: .red, location: 0.3),
            .init(color: .blue, location: 0.3),
        ],
                       center: .top,
                       startRadius: 200,
                       endRadius: 250)
        
        .ignoresSafeArea()
        //
        // Angular
        //        AngularGradient(colors: [.red, .blue, .black, .brown], center: .center)
        
        
    }
}

struct GradientDemo_Previews: PreviewProvider {
    static var previews: some View {
        GradientDemo()
    }
}
