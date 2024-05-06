//
//  BumbleFilterView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 01/05/2024.
//

import SwiftUI

struct BumbleFilterView: View {
    var options = ["Everyone", "Trending"]
    @State var selected = "Everyone"
    @Namespace private var nameSpace
    var body: some View {
        HStack(alignment: .top) {
            ForEach(options, id: \.self) { item in
                
                VStack {
                    Text(item)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                    
                    if selected == item {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selected", in: nameSpace)
                    }
                    
                }
                .background(Color.black.opacity(0.0001))
                .foregroundStyle(item == selected ? Color.black : Color.gray)
                .onTapGesture {
                    selected = item
                }
                
            }
        }
        .animation(.smooth, value: selected)
    }
}

#Preview {
    BumbleFilterView()
        .padding()
}
