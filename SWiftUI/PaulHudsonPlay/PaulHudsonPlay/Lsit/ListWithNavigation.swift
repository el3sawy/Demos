//
//  ListWithNavigation.swift
//  PaulHudsonPlay
//
//  Created by NTG on 21/07/2023.
//

import SwiftUI

struct ListWithNavigation: View {
    var body: some View {
        NavigationView {

            List(0..<100) { index in
                NavigationLink {
                    Text("Details \(index)")
                } label: {
                    Text("Show Detuls for \(index )")
                }
                .onAppear {
                    print(index)
                }

            }
            .navigationTitle("Hii")
        }
    }
}

struct ListWithNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ListWithNavigation()
    }
}
