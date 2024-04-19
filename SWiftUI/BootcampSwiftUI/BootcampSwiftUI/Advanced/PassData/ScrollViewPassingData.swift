//
//  ScrollViewPassingData.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 14/02/2024.
//

import SwiftUI

fileprivate struct ScrollViewOffset: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ScrollViewPassingData: View {
    @State var scrollOffset: CGFloat = 0.0
     
    var body: some View {
        ScrollView {
            VStack {
                headerTitle
                    .opacity(Double(scrollOffset) / 63.0)
                    .onChangeScrollView { value in
                        scrollOffset = value
                    }
                    
                cells
                    .padding(.horizontal)
            }
        }
        .padding(.top, 1)

        .background(Color.red)
        .overlay(Text("\(scrollOffset)"), alignment: .center)
        
        .overlay(navBarLayer
            .padding(.top, 1)
            .opacity(scrollOffset < 40 ? 1 : 0)
                 , alignment: .top)
    }
}

extension ScrollViewPassingData {
    
    var headerTitle: some View {
      
            Text("Header !!!!")
                .font(.largeTitle)
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 55)
    }
    var cells: some View {
        ForEach(0..<800) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brown)
                .frame(height: 120)
        }
    }
    
    var navBarLayer: some View {
        Text("navBarLayer  !!!!")
            .font(.largeTitle )
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(Color.blue)
    }
}


extension View {
    func onChangeScrollView(action: @escaping (_ value: CGFloat) -> Void) -> some View {
       self.background(
            GeometryReader{ geo in
                Text("lll")
                    .preference(key: ScrollViewOffset.self, value: geo.frame(in: .global).minY)
            }
        )
       .onPreferenceChange(ScrollViewOffset.self, perform: { value in
           withAnimation(.easeInOut) {
             action(value)
           }
           
       })
    }
}
#Preview {
    ScrollViewPassingData()
}
