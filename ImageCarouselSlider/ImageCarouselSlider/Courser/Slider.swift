//
//  Slider.swift
//  ImageCarouselSlider
//
//  Created by Mac on 20/11/2024.
//

import SwiftUI

struct FlasCardModel: Identifiable {
    let id = UUID()
    let color: Color
    var isFlipped = false

    mutating func makeItFlipped() {
        isFlipped.toggle()
    }


    static var mock: [FlasCardModel] {
        [
            .init(color: Color.red),
            .init(color: .green),
            .init(color: .purple),
            .init(color: .gray),
            .init(color: .blue),
            .init(color: .brown)
        ]
    }

}

struct Slider: View {
    @State var colors: [FlasCardModel] = FlasCardModel.mock
    @State private var scrollID: Int?
    var body: some View {
        GeometryReader {geo in
            VStack {

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(colors.indices, id: \.self) { index in
                            let item = colors[index]
                            Rectangle()
//                                .fill(index == scrollID ? Color.brown : item.color)
                                .fill(item.isFlipped ? Color.blue : item.color)
                                .containerRelativeFrame(.horizontal)
                                .frame(height: geo.size.height * 0.7)
                                .rotation3DEffect(
                                    .degrees(item.isFlipped  ? 180 : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .onTapGesture {
                                    colors[index].makeItFlipped()
                                }
                                .animation(.easeInOut, value: item.isFlipped)
                                .scrollTransition(.animated, axis: .horizontal){ content, phase in
                                    content
                                        .scaleEffect(y: phase.isIdentity ? 1 : 0.8)
                                        .opacity(phase.isIdentity ? 1.0 : 0.6)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(.horizontal, 30,for: .scrollContent)

                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    Slider()
}
