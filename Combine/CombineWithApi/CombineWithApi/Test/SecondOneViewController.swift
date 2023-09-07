//
//  SecondOneViewController.swift
//  CombineWithApi
//
//  Created by NTG on 25/08/2023.
//

import UIKit
import Combine

var sub = Set<AnyCancellable>()
class SecondOneViewController: UIViewController {
    
    private var pass = PassthroughSubject<Int, Never>()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        
  pass.sink { value in
            print(value)
        }
  .store(in: &sub)
        
        pass.send(10)
        pass.send(20)
    }
    
    deinit {
        print("Denint")
    }
}





