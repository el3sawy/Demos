//
//  LessonsLocalDataSource.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

protocol LessonsLocalDataSourceType {
    /// For getting lessons
    ///
    func fetchLessons() async throws -> [LessonEntity]

    /// For caching lessons locally
    ///
    func storeLessonsLocally(lessons: [Lesson]) async throws
    /// For Updating the isVideoCached property
    ///
    func updateLesson(lesson: Lesson) async throws
}


struct LessonsLocalDataSource: LessonsLocalDataSourceType {
    
    func updateLesson(lesson: Lesson) async throws {
        try CoreDataManager.shared.updateLesson(lesson: lesson)
    }
    
    func fetchLessons() async throws -> [LessonEntity] {
        try CoreDataManager.shared.fetchLessons()
    }
    
    func storeLessonsLocally(lessons: [Lesson]) async throws {
        try CoreDataManager.shared.addLessons(lessons: lessons)
    }
}
