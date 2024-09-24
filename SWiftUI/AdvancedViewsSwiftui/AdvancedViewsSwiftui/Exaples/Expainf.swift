//
//  Expainf.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 05/09/2024.
//

import SwiftUI

struct Expainf: View {
    @State private var expandedSections: Set<UUID> = []
    let items: [Bookmark] = [.example1, .example2, .example3]

    var body: some View {
            List(items) { bookmark in
                Section(header: HeaderView1(bookmark: bookmark, isExpanded: expandedSections.contains(bookmark.id)) {
                    toggleSection(bookmark)
                }) {
                    if expandedSections.contains(bookmark.id) {
                        ForEach(bookmark.items ?? [], id: \.id) { item in
                            HStack {
                                Image(systemName: item.icon)
                                Text(item.name)
                            }
                        }
                    }
                }
            }
            .background(Color.white)
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }

    private func toggleSection(_ bookmark: Bookmark) {
            if expandedSections.contains(bookmark.id) {
                expandedSections.remove(bookmark.id)
            } else {
                expandedSections.insert(bookmark.id)
            }
        }
}

#Preview {
    Expainf()
}
struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}
struct HeaderView1: View {
    let bookmark: Bookmark
    let isExpanded: Bool
    let onTap: () -> Void

    var body: some View {
        HStack {
            Image(systemName: bookmark.icon)
                .foregroundStyle(Color.black)
            Text(bookmark.name)
                .foregroundStyle(Color.black)
            Spacer()
            Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
        }
        .contentShape(Rectangle()) // Makes the whole row tappable
        .onTapGesture {
            onTap()
        }
    }
}
