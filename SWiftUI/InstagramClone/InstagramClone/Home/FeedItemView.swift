//
//  FeedItemView.swift
//  InstagramClone
//
//  Created by NTG on 14/07/2023.
//

import SwiftUI

struct FeedItemView: View {
    private let captionButtons = [
        Asset.heart.name,
        Asset.comment.name,
        Asset.share.name,
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView()
            feedImageView
            footerView
        }
        
    }
    
    private var footerView: some View {
        VStack {
            captionButtonsView
            numberLikesView
            CommentView()
        }
        .padding([.horizontal], 5)
    }
    
    private var feedImageView: some View {
        Image(Asset.feedImage.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private var captionButtonsView: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(captionButtons, id: \.self) { item in
                Image(item)
            }
            Spacer()
            Image(Asset.bookmark.name)
        }
    }
    
    private var numberLikesView: some View {
        HStack {
            Text("Likes")
                .font(.headline)
            Text("100")
                .font(.headline)
            Spacer()
        }
    }
    
    
    
}

struct FeedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemView()
            .previewLayout(.sizeThatFits)
    }
}

private struct HeaderView: View {
    var body: some View {
        HStack {
            Image(Asset.friend.name)
            Text("Naguib")
            Spacer()
            Image(Asset.more.name)
                .onTapGesture {
                    print("More is Tapped")
                }
        }
        .padding([.horizontal], 5)
    }
}

private struct CommentView: View {
    
    var body: some View {
        VStack {
            firstComment
            writeComment
        }
    }
    
    private var firstComment: some View {
        HStack {
            Text("Naguib")
                .font(.headline)
            Text("Hi Ahmed !!!!")
            Spacer()
        }
        
    }
    
    private var writeComment: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(Asset.friend.name)
                TextField("Write Comment", text: .constant(""))
            }
            Text("10 Minutes")
                .font(.caption)
                .foregroundColor(Color(.systemGray3))
        }
    }
}
