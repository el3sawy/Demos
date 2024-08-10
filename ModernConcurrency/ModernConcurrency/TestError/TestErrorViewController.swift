//
//  TestErrorViewController.swift
//  ModernConcurrency
//
//  Created by NTG Clarity on 29/07/2024.
//

import UIKit

class TestErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            do {
                
                
                async let (p1, p2) = try (await fetchPost(hasError: true), fetchPost(hasError: false))
//                let posts = try await fetchPost(hasError: true)
                print("================", "posts 1")
//                print(try await p1.body, " Ahmed")
                print("================", "posts 3")
                print(try await p2.body, " Ahmed")
//
//                let post2 = try await fetchPost(hasError: false)
//                print("================", "posts 2")
//                print(post2)
            } catch {
                print(error)
            }
           
           
        }
    }
    
    @MainActor
    func fetchPost(hasError: Bool) async throws -> Post {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/3")!
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        if hasError {
            throw URLError(.badServerResponse)
            
        }
        let decoder = JSONDecoder()
        let post = try decoder.decode(Post.self, from: data)
        return post
    }

}


struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}



protocol TestPro<P> {
    associatedtype P
}

func aa(t: some TestPro<Int>) {
    
}


struct SS:TestPro  {
    typealias P = String
    
    init() {
        tt1(model: Post(userId: 1, id: 2, title: "", body: ""))
        
    }
    
    func tt<T: Codable>(model: T) {
        
    }
    
    func tt1(model: any Codable) {
        var d = tt2()
    }
    
    
    func tt2() -> some TestPro {
        SS()
    }
    
    func getData() -> any Collection {
        ["s": 4 ]
    }
}



