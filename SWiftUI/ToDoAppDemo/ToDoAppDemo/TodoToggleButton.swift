//
//  TodoToggleButton.swift
//  ToDoAppDemo
//
//  Created by NTG on 13/08/2023.
//

import SwiftUI

struct TodoToggleButton: View {
    @Binding var state: Bool
    
    var body: some View {
        
        Button {
            withAnimation {
                state.toggle()
            }
            
        } label: {
            Circle()
                .strokeBorder(lineWidth: 2)
                .foregroundColor(.blue)
                .background(
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.white)
                        
                        Circle()
                            .fill( state ? .blue : .white)
                            .padding(6)
                    }
                )
                .padding(2)
        }
        .scaledToFit()
        .buttonStyle(.borderless)
    }
}

struct TodoToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        StateFullPreviewWrapper(false) { value in
            TodoToggleButton(state: value)
                .previewLayout(.fixed(width: 100, height: 100))
        }
        
    }
}
