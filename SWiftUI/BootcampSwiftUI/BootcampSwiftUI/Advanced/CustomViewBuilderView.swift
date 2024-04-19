//
//  CustomViewBuilderView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 14/02/2024.
//

import SwiftUI

fileprivate struct HeaderView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Text("Title")
            .foregroundStyle(Color.black)
            .font(.largeTitle)
        content
        
        
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 1.2)
    }
}


struct CustomViewBuilderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Love you")
                    Text("Love you")
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CustomViewBuilderView()
}



fileprivate struct LocalViewBuilder: View {
    
    enum TypeBuilder {
        case kia
        case bmw
        case toyota
    }
    let type: TypeBuilder
    var body: some View {
        
        VStack {}
        
    }
    
    
  @ViewBuilder var header: some View {
        switch type {
        case .kia:
              Text("Ahmed")
        case .bmw:
             RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
        case .toyota:
            Text("Ahmed")
        }
    }
}
