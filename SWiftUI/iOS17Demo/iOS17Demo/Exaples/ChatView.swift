//
//  ChatView.swift
//  iOS17Demo
//
//  Created by NTG Clarity on 17/11/2024.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    
                    Text("Ahmed ANguin sdsdsddsdsdsddsdsdsdsdsdsdsdsddsdsddsdsdsdsdwqeqweqweqweqweqweqeqwewqeqweqweqwwqeqeewewqeqeqqqweqe")
                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue)
                        
                        .containerRelativeFrame(.horizontal, alignment: .leading) { width, _ in
                            width * 0.9
                        }
                        
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10.0) {
                        ForEach(0...10, id: \.self) { _ in
                            Image(.carrr)
                                .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)

            }
           
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

#Preview {
    ChatView()
}

