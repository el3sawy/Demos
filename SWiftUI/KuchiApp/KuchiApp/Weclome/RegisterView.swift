//
//  RegisterView.swift
//  KuchiApp
//
//  Created by Ahmed Elesawy on 15/06/2022.
//

import SwiftUI

struct RegisterView: View {
     @State private var name = ""
    
    var body: some View {
            VStack {
                Spacer()
               WelcomeMessageView()
                TextField("Enter your name", text: $name)
                Spacer()
            }.background(WelcomeBackgroundImage())
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
