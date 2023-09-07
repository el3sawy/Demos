//
//  SendableDemoViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 26/08/2023.
//

import UIKit


 class CounterDemo {
       var  value = 0

     nonisolated func increment() ->  Int {
       value = value + 1
        return value
    }
}

class TestdDemo {
    var counter = CounterDemo()
    func play() {
        
        Task {
            var c1 = counter
            let x =  c1.value
             print( c1.increment())
        }
        
        Task {
            var c2 = counter
             print( c2.increment())
        }
        
    }
}
class SendableDemoViewController: UIViewController {
    
    let manager = ArticleManager()
    let articleTitle = "Swift Senpai Article 01"
    let test2 = TestdDemo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test2.play()
        
        
    }
    
    
    
    func dislike(_ articleTitle: String) async {
        
        guard let article = await manager.getArticle(with: articleTitle) else {
            return
        }
        
        
        // Reduce like count
        article.likeCount -= 1
    }
    
    func test() {
        let articleTitle = "Swift Senpai Article 01"
        Task  {
            
            // Create a task group
            await withTaskGroup(of: Void.self, body: { taskGroup in
                
                // Create 3000 child tasks to like
                for _ in 0..<3000 {
                    taskGroup.addTask {
                        await self.manager.like(articleTitle)
                    }
                }
                
                // Create 1000 child tasks to dislike
                for i in 0..<1000 {
                    taskGroup.addTask {
                        print(i)
                        await self.dislike(articleTitle)
                    }
                }
            })
            
            print("👍🏻 Like count: \(await manager.getArticle(with: articleTitle)!.likeCount)")
        }
    }
    
    func test2(send: ArticleManager) async {
        guard let f = send.articles.first else {
            return
        }
    }
}

