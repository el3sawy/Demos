//
//  AcreenShotView.swift
//  InAppMessagesDemo
//
//  Created by Ahmed Naguib on 05/05/2024.
//

import SwiftUI

struct AcreenShotView: View {
    var body: some View {
           VStack {
               Image(systemName: "globe")
                   .imageScale(.large)
                   .foregroundStyle(.tint)
                   
               Text("Hello, world!")
           }
           .padding()
           .background(Color.white)
           .screenshotProtected(isProtected: true)
       }
}

#Preview {
    AcreenShotView()
}
