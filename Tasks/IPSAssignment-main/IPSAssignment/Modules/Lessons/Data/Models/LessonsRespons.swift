//
//  LessonsRespons.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//


// MARK: - LessonsResponse
struct LessonsResponse: Decodable {
    let lessons: [LessonResponse]?
}

// MARK: - LessonResponse
struct LessonResponse: Decodable {
    let id: Int?
    let name, description: String?
    let thumbnail: String?
    let videoURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, thumbnail
        case videoURL = "video_url"
    }
}
