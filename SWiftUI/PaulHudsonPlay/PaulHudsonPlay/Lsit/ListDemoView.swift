//
//  ListDemoView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 17/07/2023.
//

import SwiftUI

struct ListDemoView: View {
    var body: some View {
       
        list3
        
       
    }
    
    var list1: some View {
        List {
            Section("Section 1") {
                Text("Hiii")
                Text("Hiii")
            }
            
            Section("Dynamic") {
                ForEach(0..<10) {
                    Text(" Value \($0)")
                }
            }
        }
    }
    
    var list2: some View {
        List(0..<10) { i in
            Text(" Value \(i)")
        }
        .listStyle(.grouped)
    }
    
    var list3: some View {
        
        let item = ["Ahmed", "Naguib", "koko"]
        return List(item, id: \.self) { i in
            Text("  \(i)")
//                .listRowSeparator(.hidden)
        }
        .listStyle(.grouped)
    }
}

struct ListDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView()
    }
}
