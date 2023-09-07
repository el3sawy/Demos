//
//  SafeAreaDemo.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 17/12/2022.
//

import SwiftUI

struct SafeAreaDemo: View {
    var body: some View {
        
        Demo2()
    }
}

private struct Demo2: View {
    var body: some View {
        
        ScrollView {
            ForEach(0..<20) { _ in
                
                Rectangle()
                    .fill(Color.red)
                    .frame(height: 200)
                
            }
        }
        .padding(.top, 0.1)
        .background(
            Color.blue
                .ignoresSafeArea()
        )
        
    }
}

private struct Demo: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            ScrollView {
                ForEach(0..<20) { _ in
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 200)
                    
                }
            }.padding(.top, 0.1)
        }
    }
}
struct SafeAreaDemo_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaDemo()
    }
}
