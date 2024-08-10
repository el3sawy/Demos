//
//  PassingDataView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 14/02/2024.
//

import SwiftUI

struct PassingDataView: View {
    @State var text: String = "Empty"
    @State var value = ""
    var body: some View {
        NavigationView {
            VStack {
                SecondView(title: text)
                Text("New Title is \(value)")
            }
        }
        .onPreferenceChange(CustomTitlePrefrenceKey.self , perform: { value in
            self.value = value
        })
        
    }
}


fileprivate struct SecondView: View {
     let title: String
    @State var value = ""
    var body: some View {
        Text(title)
            .onAppear(perform: getData)
            .customTitle(value)
    }
    
    private func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.value = "KOKO Ahmed"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.value = "KOKO Ahmed  test"
        }
    }
}

#Preview {
    PassingDataView()
}

extension View {
    func customTitle(_ text: String) -> some View {
        self.preference(key: CustomTitlePrefrenceKey.self, value: text)
    }
}

fileprivate struct CustomTitlePrefrenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
