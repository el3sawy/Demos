//
//  AppStorageBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 11/04/2023.
//

import SwiftUI
  
struct AppStorageBootCamp: View {
    @AppStorage("name") var userName: String?
    var body: some View {
        VStack {
            if let userName {
                Text(userName)
            }
            
            Button("Save your name") {
                userName = "Ahmed Naguib"
            }
        }
    }
}

struct AppStorageBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootCamp()
    }
}
