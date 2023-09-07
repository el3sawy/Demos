//
//  ToDoModel.swift
//  ToDoAppRx
//
//  Created by Ahmed Elesawy on 26/03/2022.
//

import Foundation

enum Types: Int {
    case flaunt
    case veryGood
    case good
}

struct ToDoModel {
    var type: Types
    var title: String
    var name: String
}
