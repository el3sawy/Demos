//
//  TextFiledDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 15/07/2023.
//

import SwiftUI

struct TextFiledDemo: View {
    @State var currency = 0.0
    @FocusState var isFoucsed: Bool
    var body: some View {
        Form {
            Section {
                TextField("Set Currency",
                          value: $currency,
                          format: .number)
                .keyboardType(.numberPad)
                .focused($isFoucsed)
        
                Text(currency,
                     format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isFoucsed = false
                }
            }
        }
    }
}

struct TextFiledDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextFiledDemo()
    }
}
