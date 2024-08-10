//
//  ShareLinkView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 08/08/2024.
//

import SwiftUI
//https://www.youtube.com/watch?v=rM_2i5YobF4
struct ShareLinkView: View {
    var body: some View {
        VStack {
            
            ShareLink(item: URL(fileURLWithPath: "aaaaaaa")) {
                Text("Share")
            }
            
            ShareLink(item: URL(fileURLWithPath: "aaaaaaa"))
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ShareLinkView()
}
