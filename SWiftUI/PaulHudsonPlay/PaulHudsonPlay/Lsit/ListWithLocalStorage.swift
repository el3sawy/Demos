//
//  ListWithLocalStorage.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import SwiftUI

private struct Student: Codable {
    var name: String
    var age: String
    static func load() -> [Student] {
        [
            .init(name: "Ahmed", age: "10"),
            .init(name: "Naguib", age: "21"),
            .init(name: "KoKO", age: "2"),
            .init(name: "Ahmed", age: "200"),
            
        ]
    }
}
class ViewModel: ObservableObject {
    
}

struct ListWithLocalStorage: View {
    //    @AppStorage("favoriteFruits") var favoriteFruits: [String] = []
    //    @AppStorage("aa") var names: [String] = [""]
    var body: some View {
        Text("Hello, World!")
          
    }
}

struct ListWithLocalStorage_Previews: PreviewProvider {
    static var previews: some View {
        ListWithLocalStorage()
    }
}





