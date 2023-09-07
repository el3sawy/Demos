//
//  ContentView.swift
//  PreferenceKeyDemo
//
//  Created by NTG on 20/08/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var text = "ahmed"
     var vm = ViewModel()
    var body: some View {
        VStack {
            Text(text)
            SecondaryView()
                .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
                    self.text = value
                }
                
        }
        .onAppear {
            vm.test()
        }
    }
    
    
    
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}


struct SecondaryView: View {
    var body: some View {
        Text("Secondary View ")
            .customTitle(loadData())
    }
    
    func loadData() -> String {
        "Get Data from child "
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

class ViewModel {
    var subscriptions = Set<AnyCancellable>()
    func test(){
        let publisher = (1...20).publisher
        publisher
            .breakpoint(receiveOutput: { value in
                return value > 10
            })
            .sink(receiveValue: { _ in })
            .store(in: &subscriptions)
    }
}

