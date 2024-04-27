//
//  ContentView.swift
//  Tasks
//
//  Created by Ahmed Naguib on 26/04/2024.
//

import SwiftUI

struct ContentView: View {
    var cats = ["Ahmed", "KOKO", "Nego", "Negeeo", "Negeo", "Neg", "Ngo"]
    @State var selectedItem = ""
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 1 , pinnedViews: .sectionHeaders) {
               
                Section {
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .frame(width: 200, height: 100)
                    }
                } header: {
                    header
                }
               
            }
            .padding(.top, 10)
        }
        .clipped()
        .ignoresSafeArea(edges: .bottom)
        
        
        
    }
    
    
    var header: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
            }
            ScrollView(.horizontal){
                HStack {
                    
                    ForEach(cats, id: \.self) { item in
                        CategoryCell(title: item,
                                     isSelected: item == selectedItem)
                        .onTapGesture {
                            withAnimation {
                                selectedItem = item
                            }
                            
                        }
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 5)
        .padding(.leading , 8)
        .background(Color.blue)
        
        
    }
}

#Preview {
    ContentView()
}
