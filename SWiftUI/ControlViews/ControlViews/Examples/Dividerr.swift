//
//  Dividerr.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 12/04/2022.
//

import SwiftUI

struct Dividerr: View {
    var body: some View {
        VStack {
            Text("Ahmed ")
            Divider()
            Text("Ahmed ")
            Divider()
            Text("Ahmed ")
            Divider()
            Text("Ahmed ")
        }.background(Color.red)
            .cornerRadius(10)
            .padding()
       
        
    }
}

struct Dividerr_Previews: PreviewProvider {
    static var previews: some View {
        Dividerr()
    }
}
