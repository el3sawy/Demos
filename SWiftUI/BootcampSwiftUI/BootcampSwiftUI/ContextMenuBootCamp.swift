//
//  ContextMenuBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 09/04/2023.
//

import SwiftUI

struct ContextMenuBootCamp: View {
    
    @State var backgroundColor: Color = .blue
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Tap to select colors")
                .font(.title)
            Text("ContextMenu Example")
                .font(.subheadline)
        }
        .foregroundColor(Color.white)
        .padding()
        .background(backgroundColor.cornerRadius(15))
        .contextMenu {
            Text("Ahmed")
            Text("Naguib")
            Text("Mohamed")
            
        }
    }
}

struct ContextMenuBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootCamp()
    }
}
