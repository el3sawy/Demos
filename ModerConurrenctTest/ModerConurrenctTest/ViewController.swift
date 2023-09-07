//
//  ViewController.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 03/01/2023.
//

import UIKit
import Combine

class ViewController: UIViewController {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//    let net = Network()
    let viewModel = ListPostsViewModel()
    private var cancellable = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadPosts()
        
        viewModel.$posts.sink { vlues in
            self.view.backgroundColor = .red
        }.store(in: &cancellable)
       
        
        
//        Task {
//            let (vales,vales2)  = try (await net.request(url: url), await net.request(url: url))
//            print(Thread.current, "First")
//        }
//
        Task {
//            let values: [PostModel] = try await net.request(url: url)
//            print(values.count)
            
        }
    
        
    }
    
   func test() async throws {
          print(Thread.current, "test")
//            let (vales,vales2)  = try (await net.modernRequest(url: url), await net.request(url: url))
//            print(Thread.current, "Second")
       URLSession.shared.dataTask(with: url) { _, _, _ in
           print(Thread.current, "Task test")
           Task {
               print(Thread.current, "Task Inner")
           }
       }.resume()
        
    }
}

