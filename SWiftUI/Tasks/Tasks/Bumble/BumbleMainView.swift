//
//  BumbleMainView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 01/05/2024.
//

import SwiftUI

struct BumbleMainView: View {
    var body: some View {
        
        VStack{
            header
            BumbleFilterView()
                .background(Divider(), alignment: .bottom)
            Spacer()
        }
        .padding()
    }
    
    private var header: some View {
        HStack {
            HStack{
                Image(systemName: "line.3.horizontal")
                    .padding(8)

                
                Image(systemName: "arrow.clockwise")
                    .padding(8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
                .font(.title)
                .foregroundStyle(Color.yellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            Image(systemName: "line.3.horizontal")
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    BumbleMainView()
}
