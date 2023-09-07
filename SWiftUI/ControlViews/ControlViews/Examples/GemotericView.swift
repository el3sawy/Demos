//
//  GemotericView.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 12/04/2022.
//

import SwiftUI

struct GemotericView: View {
    var body: some View {
        GeometryReader { geo in
            Text("Toop Ahmedsadas dasd  dasad  ")
                .fontWeight(.black)
                .position(x: geo.size.width / 5, y: geo.size.height / 10)
                .padding()
        }
    }
}

struct GemotericView_Previews: PreviewProvider {
    static var previews: some View {
        GemotericView()
    }
}
