//
//  SpaceserEx.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 12/04/2022.
//

import SwiftUI

struct SpaceserEx: View {
    var body: some View {

        VStack {
            Spacer()
            HStack {
                Text("Ahmed Mangion MOahed")
                    .underline(true ,color: Color.yellow)
                    .lineLimit(12)
                    
                Spacer()
                Text("Ahmed Mangion MOahe dsadasdasdd" )
                    .kerning(5.2)
                    .layoutPriority(1)
                Spacer()
                Text("Ahmed Mangion MOahed")
                    .baselineOffset(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal)
            
            Color.red
                .frame( height: 50)
            
        }
    }
}

struct SpaceserEx_Previews: PreviewProvider {
    static var previews: some View {
        SpaceserEx()
    }
}
