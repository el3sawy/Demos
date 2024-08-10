//
//  TaskViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 04/09/2023.
//

import UIKit

class TaskViewController: UIViewController {

    let f = Featch()
     var isSelected = true
    
    var arr = 0...10
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        
        
        print("Naguin")
        debugDemo(value: isSelected)
        
//        callApi()
    
         
    }
    
    
    func callApi() {
        
    }
    func debugDemo(value: Bool) {
       let e = arr.map({ $0 * 2 })
        
        print(arr)
        
    }
    
    func fetchImage() async throws -> UIImage? {
        let imageTask = Task { () -> UIImage? in
            
            guard Task.isCancelled == false else {
                    // Perform clean up
                    print("Image request was cancelled")
                    return nil
                }
            
            let imageURL = URL(string: "https://source.unsplash.com/random")!
            print("Starting network request...")
            let (imageData, _) = try await URLSession.shared.data(from: imageURL)
            print("Finised network request...")
            return UIImage(data: imageData)
        }
        // Cancel the image request right away:
//        imageTask.cancel()
        return try await imageTask.value
    }

}


@MainActor class Featch {
    var someCounter = 0
    
    func counter() {
        Task {
            for i in 0...10 {
                self.someCounter += 1
                print(self.someCounter)
            }
            }
    }
    func play() {
        Task {
            print(Thread.current)
            async let i = self.fetchImage()
            async let e = self.fetchImage()
            async let r = self.fetchImage()
            
            let config = try? await i
              let state = try? await e
              let data = try? await r
            
            print(Thread.current)
        }
    }
    func fetchImage() async throws -> UIImage? {
        let imageTask = Task { () -> UIImage? in
            
            guard Task.isCancelled == false else {
                    // Perform clean up
                    print("Image request was cancelled")
                    return nil
                }
            
            let imageURL = URL(string: "https://source.unsplash.com/random")!
            print("Starting network request...")
            let (imageData, ee) = try await URLSession.shared.data(from: imageURL)
            print("Finised network request...\( Thread.current)")
            return UIImage(data: imageData)
        }
        // Cancel the image request right away:
//        imageTask.cancel()
        return try await imageTask.value
    }
}


actor DemoActor {
    var arr: [String] = []
}
