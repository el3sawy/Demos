//
//  NavigationViewExample.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 06/04/2022.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Boddy")
                    .font(.title)
                    
                    Spacer()
            }.padding(.top)
            .navigationBarTitle(Text("navgation Title"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {}) { Image(systemName: "bell.fill") }
                                , trailing:  Button(action: {}) { Text("Tapped") }
            )
            
        }
    }
}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
