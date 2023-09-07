//
//  ScrollViewReaderBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 17/04/2023.
//

import SwiftUI

struct ScrollViewReaderBootCamp: View {
    
    @State var textFieldValue = ""
    @State var selectedIndex = 0
    
    var body: some View {
        
        VStack {
            TextField("Set index", text: $textFieldValue)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
            
            Button("Go to index") {
                withAnimation(.easeInOut) {
                    
                   if let index = Int(textFieldValue) {
                        selectedIndex = index
                    }
                }
            }
            
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("index \(index)")
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: selectedIndex) { newValue in
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootCamp()
    }
}
