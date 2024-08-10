//
//  LessonsResponsMapper.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

extension LessonsResponse {
    func mapToDomain() -> [Lesson] {
        lessons?.map {
            Lesson(id: $0.id ?? 0,
                   title: $0.name ?? "",
                   description: $0.description ?? "",
                   thumbnailURL: URL(string: $0.thumbnail ?? "") ?? (LessonsMocks.lessons.first?.thumbnailURL)!,
                   videoURL: URL(string: $0.videoURL ?? "") ?? (LessonsMocks.lessons.first?.videoURL)!)
        } ?? []
    }
}
