//
//  FeedListView.swift
//  InstagramClone
//
//  Created by NTG on 14/07/2023.
//

import SwiftUI

struct FeedListView: View {
    var body: some View {
        VStack {
            NavigationCustomeView()
            StoryListView()
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        FeedItemView()
//                            .padding([.vertical], 5)
                    }
                }
            }
        }
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView()
    }
}
