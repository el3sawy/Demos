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
                .clipShape(.rect(cornerRadius: 26))
        }
        .onPreferenceChange(PreferenceKeyName.self, perform: { value in
            print("222")
            self.name = value
        })
        
        .onPreferenceChange(PreferenceKeyBool.self, perform: { value in
            if value {
                name = "True"
            } else {
                name = "False"
            }
        })
    }
}

fileprivate struct PreferenceKeyTwoView: View {
    @State var name = "Ali"
    @State var counter = 0
    @State var b = true
    var body: some View {
        VStack{
            Button {
    //            tt()
                name = "KOKO \(counter)"
               
            } label: {
                Text("Tapp me plz")
            }
            Text("HIIII")
                
        }
        
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(Color.red)
        .onTapGesture {
            b.toggle()
            print("Tapped")
        }
        .customTex(name)
        .customBool(b)

    }
    
    func tt() {
        counter += 1
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


fileprivate struct PreferenceKeyBool: PreferenceKey {
    
    static var defaultValue: Bool = true
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        defaultValue = nextValue()
    }
}

fileprivate extension View {
    func customBool(_ text: Bool) -> some View {
        self.preference(key: PreferenceKeyBool.self, value: text)
    }
}
