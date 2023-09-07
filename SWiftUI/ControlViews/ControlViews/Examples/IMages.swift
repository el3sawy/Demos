//
//  IMages.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 12/04/2022.
//

import SwiftUI

struct IMages: View {
    var body: some View {
        VStack {
            Image("back")
                .resizable()
                .frame(width: 200, height: 200)
                .overlay(
                    ZStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 200, height: 44)
                    Text("Good image")
                    }
                , alignment: .bottom)
            Spacer(minLength: 2).frame(height: 20)
            HStack {
                Image("back")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Images Dsc")
            }
        }
        
    }
}

struct IMages_Previews: PreviewProvider {
    static var previews: some View {
        IMages()
    }
}
