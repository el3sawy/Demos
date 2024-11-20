//
//  RelativeSizeLayout.swift
//  iOS17Demo
//
//  Created by NTG Clarity on 17/11/2024.
//

import SwiftUI

struct RelativeSizeLayout: Layout {
    var relativeWidth: Double
    var relativeHeight: Double

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        assert(subviews.count == 1, "expects a single subview")
        let resizedProposal = ProposedViewSize(
            width: proposal.width.map { $0 * relativeWidth },
            height: proposal.height.map { $0 * relativeHeight }
        )
        return subviews[0].sizeThatFits(resizedProposal)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        assert(subviews.count == 1, "expects a single subview")
        let resizedProposal = ProposedViewSize(
            width: proposal.width.map { $0 * relativeWidth },
            height: proposal.height.map { $0 * relativeHeight }
        )
        subviews[0].place(
            at: CGPoint(x: bounds.midX, y: bounds.midY),
            anchor: .center,
            proposal: resizedProposal
        )
    }
}

extension View {
    /// Proposes a percentage of its received proposed size to `self`.
    public func relativeProposed(width: Double = 1, height: Double = 1) -> some View {
        RelativeSizeLayout(relativeWidth: width, relativeHeight: height) {
            // Wrap content view in a container to make sure the layout only
            // receives a single subview. Because views are lists!
            VStack { // alternatively: `_UnaryViewAdaptor(self)`
                self
            }
        }
    }
}
