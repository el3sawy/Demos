//
//  TextFieldBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 09/04/2023.
//

import SwiftUI

struct TextFieldBootCamp: View {
    
    @State var userName = ""
    @State var dataArray: [String] = []
    var body: some View {
        VStack {
            TextField("Enter name", text: $userName)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .font(.headline)
//                .textFieldStyle(.roundedBorder)
            
            Button {
                add()
            } label: {
                Text("Save")
                    .padding()
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .background( textIsAppropriate() ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            .disabled(!textIsAppropriate())
            ForEach(dataArray, id: \.self) { item in
                Text(item)
            }
            Spacer()
        }
        .padding()
    }
    
    func textIsAppropriate() -> Bool {
        userName.count > 3
    }
    
    func add() {
        dataArray.append(userName)
        userName = ""
    }
}

struct TextFieldBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootCamp()
    }
}
