//
//  StateTirckyView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 23/07/2023.
//

import SwiftUI

/*
 when you want to track amount value, use onChange
 */
struct StateTirckyView: View {
    
    @State var amount = 0.0
    
    var body: some View {
        VStack {
            Text("Ahmed")
                .blur(radius: amount)
            
            
            Slider(value: $amount, in: 0...20)
            
            Button("Tap") {
                amount = Double.random(in: 0...20)
            }
        }
        .onChange(of: amount) { newValue in
            print(newValue)
        }
    }
}

struct StateTirckyView_Previews: PreviewProvider {
    static var previews: some View {
        StateTirckyView()
    }
}
