//
//  ScrollDemo3.swift
//  iOS17Demo
//
//  Created by NTG Clarity on 16/11/2024.
//

import SwiftUI

struct ScrollDemo3: View {
    var body: some View {
        VStack {
            
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10.0) {
                    ForEach(FakeImages.fakeImages()) { image in
                        Rectangle()
                            .fill(image.color)
    
                            .frame(height: 225)
//                            .aspectRatio(3.0 / 2.0, contentMode: .fit)
                            .containerRelativeFrame(
                                .horizontal, count: 4, span: 3, spacing: 10.0)
                        
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(FakeImages.fakeImages()) { image in
                        Rectangle()
                            .fill(image.color)
                            .containerRelativeFrame(.horizontal)
                            .frame(height: 225)
                            .scrollTransition { content, phase in
                                content
                                    .rotation3DEffect(.degrees(phase.value * -30), axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(phase.isIdentity ? 1 : 0.4)
                            }
                        
                    }
                }
            }
            
            ScrollView(.horizontal) {
                
                
                HStack {
                    ForEach(FakeImages.fakeImages()) { image in
                        Rectangle()
                            .fill(image.color)
                            .containerRelativeFrame(.horizontal)
                            .frame(height: 225)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.4)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.4)
                            }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollDemo3()
}
