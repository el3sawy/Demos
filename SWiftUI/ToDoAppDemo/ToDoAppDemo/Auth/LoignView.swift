//
//  LoignView.swift
//  ToDoAppDemo
//
//  Created by NTG on 18/08/2023.
//

import SwiftUI

struct LoignView: View {
    @State var text = ""
    var body: some View {
        Form {
            ChildView(text: $text)
            Text(" new values is = \(text)")
        }
        .onChange(of: text) { newValue in
            print(newValue)
        }
    }
}

struct LoignView_Previews: PreviewProvider {
    static var previews: some View {
        LoignView()
    }
}


