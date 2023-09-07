//
//  TinderView.swift
//  InstagramClone
//
//  Created by NTG on 15/07/2023.
//

import SwiftUI

struct TinderView: View {
    @State var offset: CGSize = .zero
    var body: some View {
        
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
                .frame(width: 300, height: 500)
                .offset(offset)
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                )
        }
    }
    
    private func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let current = abs(offset.width)
        let percentage = current / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let current = abs(offset.width)
        let percentage = current / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return maxAngle * percentageAsDouble
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}
