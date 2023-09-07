//
//  ToDoModel.swift
//  ToDoAppDemo
//
//  Created by NTG on 13/08/2023.
//

import Foundation

struct ToDoModel: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var isDone: Bool = false
}
