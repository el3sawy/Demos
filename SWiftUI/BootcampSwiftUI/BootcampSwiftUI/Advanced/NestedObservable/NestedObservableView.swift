//
//  NestedObservableView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 19/04/2024.
//

import SwiftUI
struct NestedObservableView: View {
    
    @StateObject private  var viewModel = ViewModel()
    @SwiftUI.State private  var title = "title"
    var name: String
   
    var body: some View {
        VStack {
            Text("Counter \(viewModel.counter)")
            
            Text("Counter")
                .onTapGesture {
                    viewModel.update()
                }
            
        }
    }
}

//#Preview {
//    NestedObservableView(name: "ddd")
//}


fileprivate class ViewModel: ObservableObject {
    @Published var state = State()
    
    func update() {
        state.counter += 1
        objectWillChange.send()
    }
    
    var counter: Int {
        state.counter
        
    }
}


fileprivate class State: ObservableObject {
    @Published var counter = 0
}
