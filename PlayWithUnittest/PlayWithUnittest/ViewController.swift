//
//  ViewController.swift
//  PlayWithUnittest
//
//  Created by NTG on 30/08/2023.
//

import UIKit
import os.signpost

class ViewController: UIViewController {
    let pointsOfInterestHandler = OSLog(subsystem: "dw.qostest", category: .pointsOfInterest)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
//        os_signpost(.begin, log: pointsOfInterestHandler, name: "Refresh Panel")
//        defer {
//            os_signpost(.end, log: pointsOfInterestHandler, name: "Refresh Panel")
//        }
//        sleep(20)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Push", style: .done, target: self, action: #selector(self.test))
        
        
     Task {
            // Code to run in the detached task
            for i in 1...5 {
                print("Detached task is running \(i)")
            }
        }

        // Code in the current task continues to execute concurrently with the detached task
        for j in 1...3 {
            print("Current task is running \(j)")
        }

        
        
        // You can choose to wait for the detached task to complete, but it's not necessary
//        detachedTask.value // Accessing the value will implicitly wait for the task to complete

        print("Both tasks have finished")

        
        
       
    }
    @objc func test() {
        navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
    
}

