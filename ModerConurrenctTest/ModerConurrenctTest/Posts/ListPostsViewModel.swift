//
//  ListPostsViewModel.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 04/01/2023.
//

import Foundation
import Combine

 class ListPostsViewModel {
    private let network: NetworkProtocol
    @Published var posts: [PostModel] = []
    var isCalled = false
     var usecae: UseCaseProtocol
     init(network: NetworkProtocol = Network.shared, usecae:UseCaseProtocol = UseCase()) {
        self.network = network
         self.usecae = usecae
    }
   
  
   @MainActor @discardableResult func loadPosts() -> Task<Void, Error>  {
        isCalled = true
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
       return Task {
            posts = try await network.request(url: url)
            print(posts)
            usecae.load()
            print(Thread.current)
            
        }
    }
     
//     // Call two services as parallel
//     func fetchMedia() async throws -> MediaModel {
//         let (posts, comments) = try (await fetchPosts(), await fetchComments())
//         return .init(posts: posts, comments: comments)
//     }
//
//     func fetchMediaSequential() async throws -> MediaModel {
//         let posts = try await fetchPosts()
//         let comments = try await fetchComments()
//         return .init(posts: posts, comments: comments)
//     }
    
}

protocol UseCaseProtocol {
    func load()
}
class UseCase: UseCaseProtocol {
    func load() {
        
    }
}
