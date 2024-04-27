//
//  ListItemView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 27/04/2024.
//

import SwiftUI

struct ListItemView: View {
    @State var showHeader: Bool = true
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    StratchHeaderCell()
                        .background(
                            GeometryReader(content: { geo in
                                Text("")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .onAppear {
                                        showHeader = geo.frame(in: .global).maxY < 150
                                    }
                                    .onChange(of: geo.frame(in: .global)) { frame in
                                        showHeader =  geo.frame(in: .global).maxY < 150
                                    }
                            }
                                          ))
                    
                    
                    ForEach(0..<30) { _ in
                        Rectangle()
                            .fill(.orange)
                            .frame(height: 100)
                    }
                }
                
            }
            
            header
                
        }
        
    }
    
    var header: some View {
        ZStack {
            Text("Title Ahmed Naguib")
                .font(.headline)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.black)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.gray.opacity(0.7))
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
        }
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity)
        .animation(.smooth(duration: 0.2), value: showHeader)
        .frame(maxHeight: .infinity, alignment: .top)// here to push the black   view to top new tip}
        
    }
}

#Preview {
    ListItemView()
}
