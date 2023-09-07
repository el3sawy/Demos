//
//  WelcomeView.swift
//  KuchiApp
//
//  Created by Ahmed Elesawy on 14/06/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            WelcomeBackgroundImage()
            VStack {
                WelcomeMessageView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
