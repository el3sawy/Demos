//
//  LessonsRepository.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

protocol LessonsRepositoryType {
    /// For Getting list of lessons
    func fetchLessons() async throws -> [Lesson]
}
