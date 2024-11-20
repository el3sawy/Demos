//
//  ScrollDemo2.swift
//  iOS17Demo
//
//  Created by NTG Clarity on 16/11/2024.
//

import SwiftUI

struct ScrollDemo2: View {
    @State var scrollId: Int?
    let images = FakeImages.fakeImages()
    let width = UIScreen.main.bounds.width
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(images) { image in
                            Rectangle()
                                .fill(image.color)
                                .containerRelativeFrame(.horizontal)
//                                .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 10.0)
                                .frame(height: 225)
                        }
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(.horizontal, 30,for: .scrollContent)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $scrollId)
                
                Spacer()
                    .frame(height: 100)
                
                
                if let scrollId {
                    Text(FakeImages.name(for: scrollId))
                        .containerRelativeFrame(.horizontal)
        
                                        
                        .background(Color.red)
                }
                
                Spacer()
                    .frame(height: 100)
                
                HStack {
                    Text("Next")
                        .padding()
                        .background(Color.red)
                        .onTapGesture {
                            withAnimation { scrollId = (scrollId ?? 0) + 1 }
                        }
                    
                    Text("Back")
                        .padding()
                        .background(Color.red)
                        .onTapGesture {
                            withAnimation { scrollId = (scrollId ?? 0) - 1 }
                        }
                }
                    
            }
            
        }
    }
}

#Preview {
    ScrollDemo2()
}
struct FakeImages: Identifiable {
    let id: Int
    let color: Color
    let name: String
    
    static func fakeImages() -> [FakeImages] {
        [
            .init(id: 1, color: .red, name: "Red"),
            .init(id: 2, color: .blue, name: "Blue"),

            .init(id: 3, color: .green, name: "Green"),
            .init(id: 4, color: .yellow, name: "Yellow"),
            .init(id: 5, color: .orange, name: "Orange"),
            .init(id: 6, color: .purple, name: "Purple"),
            .init(id: 7, color: .pink, name: "Pink"),
            .init(id: 8, color: .brown, name: "Brown"),
        ]
    }
    
    static func name(for id: Int) -> String {
        fakeImages().first(where: { $0.id == id }).map(\.name) ?? ""
    }
}
