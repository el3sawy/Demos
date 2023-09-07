//
//  SubjectModel.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation


struct SubjectModel: Hashable {
    let name: String
    
    static func load() -> [SubjectModel] {
        [
            .init(name: "Programming"),
            .init(name: "Math"),
            .init(name: "Data Structure"),
            .init(name: "Compiler"),
            .init(name: "NLP"),
            .init(name: "Machine Learning"),
            .init(name: "AI"),
        ]
    }
}
