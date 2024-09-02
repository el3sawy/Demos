//
//  AlignmentGuide2demo.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 01/09/2024.
//

import SwiftUI

extension View {

    func asIcon(color: Color) -> some View {
        self
            .font(.largeTitle)
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            .padding()
            .frame(width: 64, height: 64)
            .background(color.gradient, in: .rect(cornerRadius: 16, style: .continuous))
    }
    func asBadge() -> some View {
        overlay(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(width: 50, height: 24)
                .alignmentGuide(.top, computeValue: { dimension in
                    dimension[VerticalAlignment.center]
                })
                .alignmentGuide(HorizontalAlignment.trailing, computeValue: { dimension in
                    dimension[HorizontalAlignment.center]
                })
                .fixedSize()

        }
    }
}

struct AlignmentGuide2demo: View {
    var body: some View {

       VStack {

           test
            HStack(spacing: 10) {

                Image(systemName: "phone")
                    .asIcon(color: .green)
                Image(systemName: "message")
                    .asIcon(color: .green)
                    .asBadge()
                    .zIndex(10)
                Image(systemName: "book")
                    .asIcon(color: .orange)

            }
        }
       .frame(maxWidth: .infinity)
        .padding()
    }

    var test: some View {
        Text("Home ")
            .frame(maxWidth: .infinity)
            .overlay(alignment: .top) {
                Text("Online Now")
                    .padding()
                    .background(.gray)

                    .background(.regularMaterial.shadow(.drop(color: Color.primary.opacity(0.2), radius: 2)), in: .rect(cornerRadius: 4))
                    .frame(maxWidth: .infinity)
                    .alignmentGuide(VerticalAlignment.top, computeValue: { dimension in
                        dimension[.bottom]
                    })
            }

    }
}

#Preview {
    AlignmentGuide2demo()
}
