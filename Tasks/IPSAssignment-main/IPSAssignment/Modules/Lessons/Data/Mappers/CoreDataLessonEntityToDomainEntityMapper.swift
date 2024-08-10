//
//  CoreDataLessonEntityToDomainEntityMapper.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 25/03/2023.
//

import Foundation
/// CoreData LessonEntity To Domain Entity Mapper
///

extension LessonEntity {
    func mapToLesson() -> Lesson {
        Lesson(id: Int(self.id),
               title: self.title ?? "",
               description: self.desc ?? "",
               thumbnailURL: self.thumbnailURL ?? (LessonsMocks.lessons.first?.thumbnailURL)!,
               videoURL: self.videoURL ?? (LessonsMocks.lessons.first?.videoURL)!,
               isVideoCashed: self.isVideoCashed)
    }
}
/// CoreData LessonsEntity To Domain Entity Mapper
///
extension [LessonEntity] {
    func mapToLessonsDomain() -> [Lesson]{
        self.map {
            $0.mapToLesson()
        }
    }
}
