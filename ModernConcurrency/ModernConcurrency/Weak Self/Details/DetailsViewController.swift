//
//  DetailsViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 26/08/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let mdoel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mdoel.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    deinit {
        print("deinit \(#file)")
        mdoel.cancelTasks()
    }
}


class ViewModel {
    
    var task: Task<(), Never>? = nil
    deinit {
        print("ViewModel")
    }
    func loadData() {
        task = Task.detached {
            for i in 0..<20 {
                if Task.isCancelled {
                    return // Exit the task if it's canceled.
                }
                sleep(1)
                print("\(i)")
            }
        }
    }
    
    func cancelTasks() {
        task?.cancel()
        task = nil
    }
    
}
