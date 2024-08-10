//
//  ContentView.swift
//  CustomView
//
//  Created by NTG Clarity on 02/07/2024.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    var test = "Test"
   
    
    var events: ((ProductCellEvents) -> Void) = { _ in}
    init() {
        bindProductCellEvent()
    }
    func bindProductCellEvent() {
        events = {  event in
            switch event {
                
            case .addToCart:
                print("addToCart")
                print(self.test)
            case .remove:
                print("remove")
            }
        }
    }
}

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    @State var name = ""
    @Environment(\.showError) var showError
    var body: some View {
        VStack {
            TextInputField(title: "F Name", text: $name)
                .clearButtonHidden(true)
            TextInputField(title: "F Name", text: $name)
                .clearButtonHidden(false)
            
            
            ProductCellView(onEvent: vm.events)
            
            Text("Show Error")
                .onTapGesture {
                    showError("Show Error HIIII")
                }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
