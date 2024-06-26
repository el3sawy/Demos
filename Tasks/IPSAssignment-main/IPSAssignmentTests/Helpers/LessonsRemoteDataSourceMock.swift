//
//  LessonsRemoteDataSourceeMock.swift
//  IPSAssignmentTests
//
//  Created by Mahmoud Abdulwahab on 26/03/2023.
//

import Foundation
@testable import IPSAssignment

class LessonsRemoteDataSourceMock: LessonsRemoteDataSourceType {
    /// Mock remote response
    ///
    var throwError = false
   
    func fetchLessons() async throws -> LessonsResponse {
        if throwError {
            throw IPSErrors.withMessage("ERROR")
        } else {
            let lessonList = LessonsMocks.lessons.map {
                LessonResponse (id: 1,
                                name: $0.title,
                                description: $0.description,
                                thumbnail: $0.thumbnailURL.path,
                                videoURL: $0.videoURL.path)
            }
            return  LessonsResponse(lessons: lessonList)
        }
    }
}
