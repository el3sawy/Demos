//
//  Lesson.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

public struct Lesson: Hashable {
    let id: Int
    let title: String
    let description: String
    let thumbnailURL: URL
    let videoURL: URL
    /// `isVideoCashed`  Identify if the lesson video dowloaded to files or not
    ///
    var isVideoCashed = false
    
    mutating func toggleVideoCashed(_ flag: Bool) {
        self.isVideoCashed = flag
    }
}
