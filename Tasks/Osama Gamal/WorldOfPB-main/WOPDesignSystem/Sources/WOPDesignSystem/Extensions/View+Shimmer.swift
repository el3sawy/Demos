//
//  File.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
import SwiftUI

struct ShimmerView: View {
    @State var show: Bool = false

    let speed: Double
    let angle: Angle
    let cornerRadius: CGFloat

    var gradient: LinearGradient {
        let leading = Gradient.Stop(color: .clear, location: 0)
        let center = Gradient.Stop(color: Color.white.opacity(0.3), location: 0.5)
        let trailing = Gradient.Stop(color: .clear, location: 1)

        return LinearGradient(
            gradient: .init(stops: [leading, center, trailing]),
            startPoint: .top,
            endPoint: .bottom
        )
    }

    var animation: Animation {
        Animation
            .default
            .speed(speed)
            .delay(0)
            .repeatForever(autoreverses: false)
    }

    var body: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(.systemGray3))
                .frame(width: geo.size.width, height: geo.size.height)
                .overlay(
                    self.gradient
                        .mask(RoundedRectangle(cornerRadius: cornerRadius))
                        .padding(-self.calcSize(geo))
                        .rotationEffect(self.angle)
                        .offset(x: self.calcOffset(geo), y: 0)
                        .animation(self.animation)
                )
        }
        .onAppear {
            self.show.toggle()
        }
    }

    init(speed: Double, angle: Angle, cornerRadius: CGFloat) {
        self.speed = speed
        self.angle = angle
        self.cornerRadius = cornerRadius
    }

    func calcOffset(_ geo: GeometryProxy) -> CGFloat {
        let size = calcSize(geo)
        return (self.show ? size : -size) * 2
    }

    func calcSize(_ geo: GeometryProxy) -> CGFloat {
        return max(geo.size.width, geo.size.height)
    }
}

public struct ShimmerModifier: ViewModifier {
    let isActive: Bool
    let speed: Double
    let angle: Angle
    let cornerRadius: CGFloat

    public func body(content: Content) -> some View {
        if (!isActive) { return AnyView(content) }

        let view = content
            .overlay(
                ShimmerView(speed: speed, angle: angle, cornerRadius: cornerRadius)
            )

        return AnyView(view)
    }

    public init(
        isActive: Bool,
        speed: Double,
        angle: Angle,
        cornerRadius: CGFloat
    ) {
        self.isActive = isActive
        self.speed = speed
        self.angle = angle
        self.cornerRadius = cornerRadius
    }
}

extension View {
    public func shimmer(
        isActive: Bool = true,
        speed: Double = 0.30,
        angle: Angle = .init(degrees: 120),
        cornerRadius: CGFloat = 10
    ) -> some View {

        let view = ShimmerModifier(
            isActive: isActive,
            speed: speed,
            angle: angle,
            cornerRadius: cornerRadius
        )

        return self.modifier(view)
    }
}
