//
//  StoryListView.swift
//  InstagramClone
//
//  Created by NTG on 14/07/2023.
//

import SwiftUI

struct StoryListView: View {
    private let imageNames = [
        Asset.avatar2.name,
        Asset.avatar0.name,
        Asset.avatar1.name,
        Asset.avatar2.name,
        Asset.avatar3.name,
        Asset.avatar2.name,
        Asset.avatar0.name,
        Asset.avatar1.name,
        Asset.avatar2.name,
        Asset.avatar3.name,
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(imageNames, id: \.self) { item in
                    StoryView(imageName: item, userName: item)
                }
            }
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
            .previewLayout(.sizeThatFits)
    }
}
