//
//  QuestionModel.swift
//  MultipleChoiceQuestions
//
//  Created by Ahmed Elesawy on 19/02/2023.
//

import Foundation

struct QuestionModel {
    let question: String
    let choices: [Answer]
    let indexForRightAnswer: Int
    
    
    static func getData() -> [QuestionModel] {
        [
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref")], indexForRightAnswer: 1),
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref"), .init(name: "Both")], indexForRightAnswer: 1),
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref")], indexForRightAnswer: 1),
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref")], indexForRightAnswer: 1),
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref")], indexForRightAnswer: 1),
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref")], indexForRightAnswer: 1),
            .init(question: "Class is type ?", choices: [.init(name: "Value"), .init(name: "Ref")], indexForRightAnswer: 1),
            
        ]
    }
}

struct Answer {
    let name: String
    var isSelected = false
}
