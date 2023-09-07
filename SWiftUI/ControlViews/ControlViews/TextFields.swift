//
//  TextFields.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 11/04/2022.
//

import SwiftUI

struct TextFields: View {
    @State var name: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            TextField("User name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("password", text: $password)
                .textFieldStyle(.plain)
                .frame(height: 44)
                .padding(.leading, 5)
                .overlay(
                RoundedRectangle(cornerRadius: 5)
//                    .fill(Color.red)
                    .stroke(Color.red.opacity(0.3), lineWidth: 5)
                )
                .padding()
            
            
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(Color.gray).font(.headline)
                TextField("Email", text: $name)
                    .textFieldStyle(.plain)
            }
            .frame( height: 44)
            .padding(.leading, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.red, lineWidth: 1)
            )
            .padding()
            
        
            TextField("Email", text: $name)
                .padding(.leading, 5)
                .frame( height: 44)
                .textFieldStyle(.plain)
                .border( Color.red, width: 2)
                .padding()
                .cornerRadius(10)
            
        }
        
    }
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}
