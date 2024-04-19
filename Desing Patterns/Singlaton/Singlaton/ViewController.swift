//
//  ViewController.swift
//  Singlaton
//
//  Created by Ahmed Elesawy on 01/01/2022.
//

import UIKit

class ViewController: UIViewController {
    let concurrentQueue = DispatchQueue(label: "Label ", attributes: .concurrent)
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        AppSetting.shared.add(forKey: "\(3)", value: 3)
//        for i in 1...100 {
//            concurrentQueue.async {
//           
//            }
//        }
        
//        while AppSetting.shared.getValue(forKey: "100") != 100 {
//            
//        }
        
    }

    

}


final class AppSetting {
    static var shared  = AppSetting()
    private let serialQueue = DispatchQueue(label: "serialQueue", attributes: .concurrent)
    private var dic: [String: Int] = [:]
    private init() {}
    
    func add(forKey: String, value: Int) {
        serialQueue.async {
            self.dic[forKey] = value
        }
    }
    
    func getValue(forKey: String) -> Int {
        serialQueue.sync {
            print(forKey)
        return dic[forKey] ?? 0
        }
    }
}





