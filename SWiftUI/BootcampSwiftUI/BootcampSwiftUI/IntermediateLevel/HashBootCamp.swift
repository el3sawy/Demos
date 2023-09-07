//
//  HashBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 24/04/2023.
//

import SwiftUI

 struct Student: Hashable {
    var name: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

struct HashBootCamp: View {
    var arr: [Student] = [
        .init(name: "Ahmed"),
        .init(name: "Ahmed"),
        .init(name: "NAguib"),
    ]
    var body: some View {
        VStack {
            ForEach(arr, id: \.self) { item in
                Text(item.hashValue.description)
            }
        }
    }
}

struct HashBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        HashBootCamp()
    }
}
