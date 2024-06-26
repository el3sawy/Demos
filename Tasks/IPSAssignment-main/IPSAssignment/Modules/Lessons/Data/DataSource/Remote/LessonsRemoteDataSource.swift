//
//  LessonsRemoteDataSource.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation
import Combine

import Foundation

protocol LessonsRemoteDataSourceType {
    /// For getting lessons
    ///
    func fetchLessons() async throws -> LessonsResponse
}

struct LessonsRemoteDataSource: LessonsRemoteDataSourceType {
    
    init() {}
    
    func fetchLessons() async throws -> LessonsResponse {
        guard let url = URL(string: Constants.baseURL) else { throw IPSErrors.withMessage("Invalid URL") }
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        guard let response = (urlResponse as? HTTPURLResponse) else { throw IPSErrors.withMessage("invalid Response") }
        if !((200..<300) ~=  response.statusCode) {
            /// I can handle different errors like business need
            throw IPSErrors.withMessage("Something went wrong 🫣")
        }
        let lessons = try JSONDecoder().decode(LessonsResponse.self, from: data)
        return lessons
    }
}
