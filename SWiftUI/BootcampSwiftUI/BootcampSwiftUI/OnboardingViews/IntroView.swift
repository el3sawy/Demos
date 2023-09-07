//
//  IntroView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 11/04/2023.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("logged_in") var userIsLoggedIn = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.purple.opacity(0.3)]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if userIsLoggedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
