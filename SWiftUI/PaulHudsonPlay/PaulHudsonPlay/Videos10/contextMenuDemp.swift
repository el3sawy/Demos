//
//  contextMenuDemp.swift
//  PaulHudsonPlay
//
//  Created by NTG on 24/07/2023.
//

import SwiftUI

struct contextMenuDemp: View {
    
    @State var bkColor: Color = .red

    var body: some View {
        
        VStack {
            Text("HIIII Ahmed")
                .padding()
                .background(bkColor)
            
            
            Text("Select your color")
                .padding()
                .background(.blue)
                .contextMenu {
                      
                    Button("REd") {
                        bkColor = .red
                    }
                    
                    Button("Blur") {
                        bkColor = .blue
                    }
                    
                    Button("Yello") {
                        bkColor = .yellow
                    }
                    
                }
            
        }
    }
}

struct contextMenuDemp_Previews: PreviewProvider {
    static var previews: some View {
        contextMenuDemp()
    }
}
