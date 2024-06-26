//
//  CoreDataManager.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import UIKit
import CoreData
import SwiftUI
protocol CoreDataManagerProtocol{
    func fetchLessons() throws -> [LessonEntity]
    func addLessons(lessons: [Lesson]) throws
    func addNewLesson(lesson: Lesson) throws
    func updateLesson(lesson: Lesson) throws
    func updateIsVideoCachedFlag(with lessonID: Int, flag: Bool) throws
}

class CoreDataManager : CoreDataManagerProtocol{

    static let shared = CoreDataManager()
    private let managedObjectContext = PersistenceController.shared.container.viewContext
    private init(){}

    func fetchLessons() throws -> [LessonEntity] {
        return try managedObjectContext.fetch(LessonEntity.fetchRequest())
    }
    
    func addNewLesson(lesson: Lesson) throws {
        let lessonEntity = LessonEntity(context: managedObjectContext)
        lessonEntity.id   = Int32(lesson.id)
        lessonEntity.title = lesson.title
        lessonEntity.desc = lesson.description
        lessonEntity.thumbnailURL = lesson.thumbnailURL
        lessonEntity.videoURL = lesson.videoURL
        lessonEntity.isVideoCashed = false
    }
    
    func updateIsVideoCachedFlag(with lessonID: Int, flag: Bool = true) throws {
        let fetchRequest: NSFetchRequest<LessonEntity> = LessonEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %i", lessonID)
        let results = try managedObjectContext.fetch(fetchRequest)
        if let existingLesson = results.first {
            existingLesson.isVideoCashed = flag
        }
        try saveContext()
    }
    
    func updateLesson(lesson: Lesson) throws {
        let fetchRequest: NSFetchRequest<LessonEntity> = LessonEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %i", lesson.id)
        let results = try managedObjectContext.fetch(fetchRequest)
        if let existingLesson = results.first {
            ///  Update existing object * Im ignoring the is isVideoCashed Property *
            existingLesson.title = lesson.title
            existingLesson.desc = lesson.description
            existingLesson.thumbnailURL = lesson.thumbnailURL
            existingLesson.videoURL = lesson.videoURL
        }
    }
    
    func addLessons(lessons: [Lesson]) throws {
        for lesson in lessons {
            let fetchRequest: NSFetchRequest<LessonEntity> = LessonEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %i", lesson.id)
            do {
                let results = try managedObjectContext.fetch(fetchRequest)
                if let existingLesson = results.first {
                  try updateLesson(lesson: existingLesson.mapToLesson())
                } else {
                    /// Create new object
                  try addNewLesson(lesson: lesson)
                }
            } catch {
                print("Error fetching or saving data: \(error)")
                throw error
            }
        }
        try saveContext()
    }

    func saveContext() throws{
        do {
            try managedObjectContext.save()
        } catch let error {
            throw error
        }
    }
}
