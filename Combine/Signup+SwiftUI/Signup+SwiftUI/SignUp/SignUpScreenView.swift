//
//  SignUpScreenView.swift
//  Signup+SwiftUI
//
//  Created by Ahmed Elesawy on 30/01/2023.
//

import SwiftUI

struct SignUpScreenView: View {
    @ObservedObject private var viewModel = SignUpScreenViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("User name", text: $viewModel.username)
            } footer: {
                Text(viewModel.usernameMessage)
                    .foregroundColor(.red)
            }
            
            Section {
                Button("Sign up") {
                    print("Signing up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
        }
    
    }
}

struct SignUpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreenView()
    }
}
