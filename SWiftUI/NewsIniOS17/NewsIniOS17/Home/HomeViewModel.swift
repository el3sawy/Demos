//
//  HomeViewModel.swift
//  NewsIniOS17
//
//  Created by NTG Clarity on 23/10/2024.
//

import Foundation
import Combine
import Observation

@Observable
final class HomeViewModel {
    var names: [String] = []
    var count: Int = 0
    
    init () {
        names = ["Ahmed", "Ali", "Majid", "Sara", "Noor", "Nowewora", "Noora", "Nooera", "Nooeera", "Nowewra"]
           
//        names.sink { _ in
//            
//        }
    }
}


class HomeViewModel2: ObservableObject {
    @Published var name = ""
    @Published var isEnabe = false
    init(name: String = "") {
        self.name = name
        $name.map {
            $0.count > 3
        }
        .assign(to: &$isEnabe)
    }
}
