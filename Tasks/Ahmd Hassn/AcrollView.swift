//
//  AhmedHassan.swift
//  PLAY
//
//  Created by Mac on 14/09/2024.
//

import SwiftUI
import Combine
#Preview {
    AhmedHassan()
}



// MARK: ContentView

struct AhmedHassan: View {
    @State
    private var rendersHeaderView = false
    private let scrollDetector = ScrollDetector()

    var body: some View {
        VStack {
            // Header
            if rendersHeaderView {
                Text("Header")
            }

            // Scroll view with offset
            OffsetScrollView(
                offsetChange: { offset in
                    scrollDetector.updateOffset(offset)
                },
                content: {
                    ForEach(Array(1...100).map(\.description), id: \.self) { item in
                        Text(item)
                            .padding(20)
                            .backgroundStyle(Color.green)
                    }
                }
            )
        }
        .onReceive(scrollDetector.scrollingPublisher) { isVisible in
            withAnimation {
                rendersHeaderView = isVisible
            }
        }
    }
}


// MARK: ScrollDetector

struct ScrollDetector {
    init() {
        let visiblePublisher = scrollOffsetSubject
            .debounce(for: 0.8, scheduler: DispatchQueue.main)
            .map { _ in true }

        let hiddenPublisher = scrollOffsetSubject
            .throttle(for: 0.3, scheduler: DispatchQueue.main, latest: false)
            .map { _ in false }

        scrollingPublisher = Publishers.Merge(visiblePublisher, hiddenPublisher)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    func updateOffset(_ offset: CGFloat) {
        // Skip small offset changes
        if abs(scrollOffsetSubject.value - offset) > 5.0 {
            scrollOffsetSubject.send(offset)
        }
    }

    let scrollingPublisher: AnyPublisher<Bool, Never>
    private let scrollOffsetSubject = CurrentValueSubject<CGFloat, Never>(.zero)
}

// MARK: OffsetScrollView

struct OffsetScrollView<Content: View>: View {
    let offsetChange: (CGFloat) -> Void
    let content: () -> Content

    var body: some View {
        ScrollView {
            offsetReader
            content()
        }
        .coordinateSpace(name: "scrollSpace")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: offsetChange)
    }

    var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("scrollSpace")).minY
                )
        }
        .frame(height: 0)
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
