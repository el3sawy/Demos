//
//  TextEditDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 29/07/2023.
//

import SwiftUI

struct TextEditDemo: View {
    @State var text = "Color.red"
   
    var body: some View {
        
        TextField("Title", text: $text)
            .textFieldStyle(.roundedBorder)
              
            .onChange(of: text) { newValue in
                print(newValue)

            }
           
    }
}

struct TextEditDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextEditDemo()
    }
}
