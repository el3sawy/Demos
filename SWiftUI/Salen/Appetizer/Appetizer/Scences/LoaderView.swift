//
//  LoaderView.swift
//  Appetizer
//
//  Created by Ahmed Elesawy on 10/01/2022.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color(.red)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                .scaleEffect(5)
        }
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
