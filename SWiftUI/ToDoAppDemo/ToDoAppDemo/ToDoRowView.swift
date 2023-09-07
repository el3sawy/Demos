//
//  ToDoRowView.swift
//  ToDoAppDemo
//
//  Created by NTG on 13/08/2023.
//

import SwiftUI

struct ToDoRowView: View {
   @Binding var item: ToDoModel
    
    var body: some View {
        
        HStack {
            TodoToggleButton(state: $item.isDone)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                
                Text(item.title)
                    .font(.title)
                    .strikethrough(item.isDone)
                Text(item.description ?? "")
                    .font(.subheadline)
                    .strikethrough(item.isDone)
                
            }
            Spacer()
        }
        .padding(.leading, 5)
    }
}

struct ToDoRowView_Previews: PreviewProvider {
    static let item = ToDoModel(title: "Tiille", description: "Desc desc")
    static let item2 = ToDoModel(title: "Tiille", description: "Desc desc")
   
    
    static var previews: some View {
        Group {
            ToDoRowView(item: .constant(item))
                .previewDisplayName("Whout")
            
            StateFullPreviewWrapper(item2) { value in
                ToDoRowView(item: value)
            }
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
