//
//  TaskDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 04/09/2023.
//

import SwiftUI

class ViewModel2: ObservableObject {
    @Published var name = "Hello"
    
    func doWork() {
        Task {
               for i in 1...100 {
                   print("In Task 1: \(i)")
               }
           }

        Task {
               for i in 1...100 {
                   print("In Task 2: \(i)")
               }
           }
       }
}

struct Task1Demo: View {
    @StateObject private var model = ViewModel2()
    var body: some View {
        VStack {
            Text("Hello, \(model.name)!")
            Button("Authenticate", action:model.doWork)
//            Button("Authenticate") {
//                Task {
//                    model.name = "Taylor"
//                }
//            }
        }
    }
    
    
    
    
}

struct Task1Demo_Previews: PreviewProvider {
    static var previews: some View {
        Task1Demo()
    }
}
