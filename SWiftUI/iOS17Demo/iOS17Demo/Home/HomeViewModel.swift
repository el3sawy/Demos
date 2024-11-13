//
//  HomeViewModel.swift
//  iOS17Demo
//
//  Created by Mac on 26/10/2024.
//

import Foundation
import Combine
import Observation

@Observable class HomeViewModel {
    var fName = ""
    var lName = ""
     var count = 0
     var name = "" {
        didSet {
            pub.send(name)
        }
    }

    var fullName: String {
        fName + lName
    }
    private var pub = PassthroughSubject<String, Never>()


    init() {

        fName  = "dddd"
        pub.sink { _ in
            print("")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.name = "Ahmed"
        }
    }


    func add() {
        count += 1
        print(count)
    }
}
