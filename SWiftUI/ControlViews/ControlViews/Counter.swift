//
//  Counter.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 11/04/2022.
//

import SwiftUI

struct Counter: View {
    @State var count = 1
    var body: some View {
        VStack {
            Stepper("Counter : ", value: $count)
            Text("vleus: = \(count)")
        }
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}
