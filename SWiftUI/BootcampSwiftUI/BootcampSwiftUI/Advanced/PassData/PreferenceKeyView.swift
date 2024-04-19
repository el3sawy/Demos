//
//  PreferenceKeyView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 18/04/2024.
//

import SwiftUI

struct PreferenceKeyView: View {
    @State var name = "Ahmed"
    var body: some View {
        VStack {
            Text(name)
            PreferenceKeyTwoView()
            DemoGEO()
        }
        .onPreferenceChange(PreferenceKeyName.self, perform: { value in
            print("222")
            self.name = value
        })
    }
}

fileprivate struct PreferenceKeyTwoView: View {
    @State var name = "Ali"
    var body: some View {
        Button {
            name = "KOKO"
        } label: {
            Text("Tapp me plz")
        }
        .customTex(name)

    }
}

fileprivate struct DemoGEO: View {
    var body: some View {
     
        Rectangle()
            .fill(Color.yellow)
            .frame(width: 100, height: 100)
            .background(
                GeometryReader{ geo in
                    Color.red
                        .onAppear{
                            let _ =  print(geo.size.width)
                        }
                }
                    .border(Color.red)
            )
        
    }
    
}

#Preview {
    PreferenceKeyView()
}

fileprivate struct PreferenceKeyName: PreferenceKey {
    
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        defaultValue = nextValue()
    }
}

fileprivate extension View {
    func customTex(_ text: String) -> some View {
        self.preference(key: PreferenceKeyName.self, value: text)
    }
}
