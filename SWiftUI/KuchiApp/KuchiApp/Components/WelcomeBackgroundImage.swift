//
//  WelcomeBackgroundImage.swift
//  KuchiApp
//
//  Created by Ahmed Elesawy on 15/06/2022.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        Image("welcome-background")
          .resizable()
          .aspectRatio(1 / 1, contentMode: .fill)
          .edgesIgnoringSafeArea(.all)
          .saturation(0.5)
          .blur(radius: 5)
          .opacity(0.08)
    }
}

struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
