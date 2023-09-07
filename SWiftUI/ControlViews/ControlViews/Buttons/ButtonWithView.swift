//
//  ButtonWithView.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 06/04/2022.
//

import SwiftUI

struct ButtonWithView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .padding(20)
                        .background(Color.purple)
                        .foregroundColor(Color.white)
                        .cornerRadius(.infinity)
                }.padding([.trailing, .bottom], 30)
            }
        }
    }
}

struct ButtonWithView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithView()
    }
}
