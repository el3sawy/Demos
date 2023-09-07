//
//  ProfileView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 12/04/2023.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("logged_in") var userIsLoggedIn = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "Your name")
            Text("Your age is \(currentUserAge ?? 0)")
            Text("Your gender is \(currentUserGender ?? "Not found")")
            
            
            Text("SignOut")
                .foregroundColor(Color.purple)
                .font(.headline)
                .fontWeight(.semibold)
                .onTapGesture {
                    userIsLoggedIn = false
                }
                
            
        }

        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.purple)
        .background(Color.white.cornerRadius(10))
        .shadow(radius: 10)
        .padding(30)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
