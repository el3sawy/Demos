//
//  FormDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 15/07/2023.
//

import SwiftUI
//https://sarunw.com/posts/swiftui-form-styling/
struct FormDemo: View {
    var body: some View {
        Form {
            Section {
                Text("Title")
                Text("Title")
                Text("Title")
                Text("Title")
            } header: {
                Text("Internet")
            }
            .listRowBackground(Color.yellow)
            
            
            
            Group {
                Text("Ahmed")
                Text("Ahmed")
                Text("Ahmed")
                Text("Ahmed")
            }
             .listRowBackground(Color.clear)
            Group {
                Text("Ahmed")
                Text("Ahmed")
                Text("Ahmed")
                Text("Ahmed")
            }
        }
        .accentColor(.red)
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}
