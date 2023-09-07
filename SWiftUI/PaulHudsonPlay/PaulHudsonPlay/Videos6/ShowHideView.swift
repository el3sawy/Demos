//
//  ShowHideView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 18/07/2023.
//

import SwiftUI

struct ShowHideView: View {
    @State var isShow = false
    var body: some View {
        VStack {
            Button("Show") {
                withAnimation {
                    isShow.toggle()
                }
                
            }
            
            if isShow {
                Rectangle()
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ShowHideView_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideView()
    }
}
