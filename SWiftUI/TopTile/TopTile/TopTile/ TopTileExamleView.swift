//
//   TopTileExamleView.swift
//  TopTile
//
//  Created by NTG Clarity on 07/07/2024.
//

import SwiftUI

struct TopTileExamleView: View {
    @State private var background: Color = .orange
    @State private var showTooltip = false
    var body: some View {
        
        VStack(spacing: 0) {
            header
            Rectangle().fill(.gray)
                .onTapGesture {
                    background = .random
                }
            let _ = print(type(of: tooltip))
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    var helpButton: some View {
        Button {
            showTooltip.toggle()
        } label: {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundStyle(.white)
        }
    }
    
    private var header: some View {
        helpButton
            .overlay(alignment: .bottom) {
                tooltip
            }
            .zIndex(1)
            .padding(.leading, 70)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(background)
    }
    
    @ViewBuilder
    private var tooltip: some View {
        if showTooltip {
            TopTileView()
                .fixedSize()
                .alignmentGuide(.bottom) { $0[.top] - 8 }
                .alignmentGuide(HorizontalAlignment.center) { $0.width / 4 }
//                .scaleEffect(
//                    showTooltip ? CGSize(width: 1.0, height: 1.0) : .zero,
//                    anchor: UnitPoint(x: 0.25, y: 0)
//                )
//                .animation(.easeInOut(duration: 0.3), value: showTooltip)
//                .allowsHitTesting(showTooltip)
        }
        
    }
// / ModifiedContent<ModifiedContent<ModifiedContent<Tooltip, _FixedSizeLayout>, _AlignmentWritingModifier>, _AlignmentWritingModifier>
//   ModifiedContent<ModifiedContent<ModifiedContent<Tooltip, _FixedSizeLayout>, _AlignmentWritingModifier>, _AlignmentWritingModifier>>
}

#Preview {
    TopTileExamleView()
}


