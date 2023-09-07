//
//  RequestPosts.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 04/01/2023.
//

import Foundation

enum RequestPosts {
    case listPosts
    case listComments
    
    var url: URL {
        switch self {
        case .listPosts:
            return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        case .listComments:
            return URL(string: "https://jsonplaceholder.typicode.com/comments")!
        }
    }
}
