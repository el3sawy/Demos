//
//  MainActorDemoViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 04/05/2023.
//

import UIKit

class MainActorDemoViewController: UIViewController {
    private var tasks = [Task<Void, Never>]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counter = Counter()
        
        
        for _ in 1...1000 {
            tasks += [
                Task {
                    print(counter.increment())
                }
            ]
        }
        
        
    }
    
    
    func normalActor() async {
        await MainActor.run {
            print("Hi Nego")
        }
    }
    
    func returnWithValue() async -> Int {
        let result = await MainActor.run{ () -> Int in
            sleep(2)
            print("This is run on the main actor.")
            return 11
        }
        return result
    }
    
    func showResultOutOfScobe() async {
        let result = Task { @MainActor in
            sleep(2)
            print("This is run on the main actor.")
            return 11
        }
        
        print("Out of scope")
        print(await result.value)
        
    }
    
}

final class Counter {
    private var count = 0
    func increment() -> Int {
        count += 1
        return count
    }
}
