//
//  ListPostsUseCase.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 04/01/2023.
//

import Foundation

protocol ListPostsUseCaseProtocol {
    func fetchPosts() async throws -> [String?]
    func fetchComments() async throws -> [String?]
}

class ListPostsUseCase {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
}

extension ListPostsUseCase: ListPostsUseCaseProtocol {
    // Call one service
    func fetchPosts() async throws -> [String?] {
        let posts: [PostModel] = try await network.request(url: RequestPosts.listPosts.url)
        return posts.map(\.title)
    }
    
    // Call one service as well
    func fetchComments() async throws -> [String?] {
        let comments: [CommentModel] = try await network.request(url: RequestPosts.listComments.url)
        return comments.map(\.body)
    }
}
