//
//  ImageCarousel.swift
//  ImageCarouselSlider
//
//  Created by Mac on 20/11/2024.
//

import SwiftUI

struct ImageCarousel: View {
    @State var scrollPosition: Int?
    private let pageWidth: CGFloat = 250
    private let pageHeight: CGFloat = 350
    private let colors = Colors.allCases

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<colors.count, id:\.self) { index in
                    let color = colors[index]
                    Text(color.rawValue)
                        .foregroundStyle(.black)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: pageWidth, height: pageHeight)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(color.color)
                        )
                        .padding(.horizontal, (UIScreen.main.bounds.width - pageWidth)/2)
                        
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)

    }
}
#Preview {
    ImageCarousel()
}
