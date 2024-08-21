//
//  Al ignmentGuideView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI
//https://www.youtube.com/watch?v=fdSGlCgz1fQ/
struct Al_ignmentGuideView: View {
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .alignmentGuide(.leading, computeValue: { dimension in
                       return 20
                    })
            }
            .padding(.bottom, 30)
            
            HStack(alignment: .bottom) {
                Image(systemName: "1.circle.fill").imageScale(.large)
                Image(systemName: "2.circle.fill")
                    .imageScale(.large)
                    .alignmentGuide(.bottom) { d in
                        d[VerticalAlignment.top]
                        
                    }
                    
                Image(systemName: "3.circle.fill").imageScale(.large)
                
            }
            
            
            HStack(alignment: .bottom, spacing: 0) {
                Text("H")
                Text("2")
                    .alignmentGuide(.bottom, computeValue: { dimension in
                        dimension[.bottom] - 15
                        
                    })
                Text("0")
            }
            .font(.largeTitle)
            
            Spacer()
            HStack(alignment: .bottom) {
                Image(systemName: "lightbulb.fill")
                    .imageScale(.large)
                    .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                        dimension[.bottom]
//                        0
                    })
                Text("Light")
                    .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                        dimension[.lastTextBaseline]
//                        0
                    })
            }
            .font(.largeTitle)
    
        }
    }
}

#Preview {
    Al_ignmentGuideView()
}
