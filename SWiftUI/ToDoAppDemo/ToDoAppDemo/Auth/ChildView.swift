//
//  ChildView.swift
//  ToDoAppDemo
//
//  Created by NTG on 18/08/2023.
//

import SwiftUI

struct ChildView: View {
    
    @Binding var text: String
    
    
    var body: some View {
       
            TextField("Titile", text: $text)
    
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView(text: .constant(""))
    }
}
