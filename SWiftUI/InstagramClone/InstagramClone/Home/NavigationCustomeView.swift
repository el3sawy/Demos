//
//  NavigationView.swift
//  InstagramClone
//
//  Created by NTG on 14/07/2023.
//

import SwiftUI

struct NavigationCustomeView: View {
    private let buttons = ["add", "heart", "messenger"]
    var body: some View {
        HStack {
            Image(Asset.logo.name)
            Spacer()
            ForEach(buttons, id: \.self) { imageName in
                NavigationLink(
                    destination: Text(imageName)) {
                        Image(imageName)
                    }
            }
        }
        .padding([.horizontal], 5)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationCustomeView()
            .previewLayout(.sizeThatFits)
    }
}
