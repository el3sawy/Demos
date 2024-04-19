//
//  ContentView.swift
//  GeometryReaderDemo
//
//  Created by Ahmed Naguib on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Text("GeometryReader")
//            Image(systemName: "bolt.circle.fill")
////            Spacer()
//            Image(systemName: "bolt.circle.fill")
////            Spacer()
//        }.font(.largeTitle)
                VStack {
                    Text("GeometryReader")
        
                    Image(systemName: "bolt.circle.fill")
        
                    GeometryReader { geometry in
                        VStack(alignment: .leading) {
                            Text("Width \(geometry.size.width)")
//                                .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                            
                            Text("Height \(geometry.size.height)")
                            
                            Text("Frame \(geometry.frame(in: .local).maxX)")
                            Text("Frame \(geometry.frame(in: .global).maxY)")
                            Text("Local \(geometry.frame(in: .local).maxY)")
                            Divider()
                                .frame(height: 5)
                                .background(Color.green)
                            
                            Text("Leading \(geometry.safeAreaInsets.leading)")
                            Text("bottom \(geometry.safeAreaInsets.bottom)")
                                
                        }
                        
                    }
                    .background(Color.red)
//                    .padding(.bottom, 1)
        
                }.font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
