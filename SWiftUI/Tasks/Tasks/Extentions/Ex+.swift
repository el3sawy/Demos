//
//  Ex+.swift
//  Tasks
//
//  Created by Ahmed Naguib on 04/05/2024.
//

import Foundation
import SwiftUI


extension View {
    func readingFrame1(coordinateSpace: CoordinateSpace = .global,
                      onChange: @escaping (_ frame: CGRect) -> ()) -> some View {
        
        
        background(
            FrameReader(coordinateSpace: coordinateSpace, onChange: onChange)
        )
        
    }
}

public struct FrameReader: View {
    
    let coordinateSpace: CoordinateSpace
    let onChange: (_ frame: CGRect) -> Void
    
   public init(coordinateSpace: CoordinateSpace, onChange: @escaping (_ frame: CGRect) -> Void) {
        self.coordinateSpace = coordinateSpace
        self.onChange = onChange
    }
    public var body: some View {
        GeometryReader { geometry in
            
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    onChange(geometry.frame(in: coordinateSpace))
                }
            
                .onChange(of: geometry.frame(in: coordinateSpace), perform: onChange)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
