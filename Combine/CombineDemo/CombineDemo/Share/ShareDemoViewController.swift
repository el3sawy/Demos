//
//  ShareDemoViewController.swift
//  CombineDemo
//
//  Created by NTG on 25/08/2023.
//

import UIKit
import Combine

class ShareDemoViewController: UIViewController {
    private var bag = AppBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .map{ _ in Int.random(in: 0..<1000)  }
            .share()
        
        timer.sink { value in
            print("A = \(value)")
        }
        .store(in: &bag)
        
        
        timer.sink { value in
            print("B = \(value)")
        }
        .store(in: &bag)
    }
}
