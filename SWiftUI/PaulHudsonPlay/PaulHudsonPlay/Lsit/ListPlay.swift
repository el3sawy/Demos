//
//  ListPlay.swift
//  PaulHudsonPlay
//
//  Created by NTG on 05/08/2023.
//

import SwiftUI

struct ListPlay: View {
    
    @State private var selectedItemId: Int? = nil
    
    let items = Array(1...100)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.fixed(100))], spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        selectedItemId = item
                    }) {
                        Text("\(item)")
                            .frame(width: 100, height: 100)
                            .background(selectedItemId == item ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    .onAppear {
                        print(item)
                    }
                }
            }
            .padding()
        }
        
    }
}

struct ListPlay_Previews: PreviewProvider {
    static var previews: some View {
        ListPlay()
    }
}
