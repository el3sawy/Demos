//
//  PickerViewExample.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 11/04/2022.
//

import SwiftUI

struct PickerViewExample: View {
    var names = ["Ahmed", "Naguib", "Moahmed", "Hamed"]
    @State var selectedName = ""
    var body: some View {
        VStack {
            Picker("Title", selection: $selectedName) {
                ForEach(names, id: \.self) { item in
                    Text(item).tag(item)
                }
            }.pickerStyle(.inline)
            
            Picker(selection: $selectedName, label: Text("")) {
                    ForEach(0 ..< names.count) {
                        Text(self.names[$0])
                    }
                }.padding()
                     .frame(width: 200, height: 150, alignment: .center)
        }
        
    }
}

private struct Row: View {
    var name: String
    var body: some View {
        HStack {
            Text(name)
            Image(systemName: "person.fill")
        }.tag(name)
    }
}

struct PickerViewExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerViewExample()
    }
}
