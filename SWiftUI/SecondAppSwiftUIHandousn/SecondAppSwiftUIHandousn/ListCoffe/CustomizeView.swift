//
//  CustomizeView.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import SwiftUI

struct SizeOptions {
    var id: Int
    var name: String
    
    static func load() -> [SizeOptions] {
        [
            .init(id: 2, name: "Small"),
            .init(id: 10, name: "Medium"),
            .init(id: 20, name: "Large"),
        ]
    }
}
struct CustomizeView: View {
    let sizeOptions = SizeOptions.load()
    @State private var size = 0
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Selection", selection: $size) {
                    ForEach(sizeOptions, id: \.id) { option in
                        Text(option.name)
                    }
                }
                .pickerStyle(.segmented)
                
            }
            .onChange(of: size) { newValue in
                print(newValue)
            }
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView()
    }
}
