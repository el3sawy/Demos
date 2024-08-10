//
//  LessonsUseCase.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

protocol LessonsUseCaseType {
    /// To get lessons list
    ///
    func execute() async throws -> [Lesson]
}

struct LessonsUsecase: LessonsUseCaseType {
    
    let lessonsRepository: LessonsRepositoryType
    
    init(lessonsRepository: LessonsRepositoryType = LessonsRepository()) {
        self.lessonsRepository = lessonsRepository
    }
    
    func execute() async throws -> [Lesson] {
        try await lessonsRepository.fetchLessons()
    }
}
