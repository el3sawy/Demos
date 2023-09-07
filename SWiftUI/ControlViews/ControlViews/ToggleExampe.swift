//
//  ToggleExampe.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 11/04/2022.
//

import SwiftUI

struct ToggleExampe: View {
    @State var isOn = false
    var body: some View {
        VStack {
        Toggle(isOn: $isOn) {
            Text("Open This")
            Image(systemName: "moon")
        }
        .padding()
        
        
        VStack {
            Text("Open This")
            Toggle("sss" , isOn: $isOn)
                .labelsHidden()
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
        }
    }
}

struct ToggleExampe_Previews: PreviewProvider {
    static var previews: some View {
        ToggleExampe()
    }
}
