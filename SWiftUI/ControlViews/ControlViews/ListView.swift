//
//  ListView.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 06/04/2022.
//

import SwiftUI

struct ListView: View {
    
    var arr = ["Ahmed", "Naguib", " Ahmed Ahmed Ahmed", "Naguib Naguib Naguib Naguib Naguib Naguib Naguib "]
    var body: some View {
        List(arr, id: \.self) { str in
            Text(str)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
