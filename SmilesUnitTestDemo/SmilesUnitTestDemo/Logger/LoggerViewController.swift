//
//  LoggerViewController.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 17/01/2024.
//

import UIKit

class LoggerViewController: UIViewController {
    
    private var concurrentQueue = DispatchQueue(label: "Smiles.concurrent.com", attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
//        play()
//        playWithMultiThreading()
     
    }
    
    func play() { // will work fine because all the logger will process in one thread
        for i in 0..<101 {
            Logger.shared.write(key: "\(i)", content: i)
           
           
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func playWithMultiThreading() {
        for i in 0..<101 {
            concurrentQueue.async {
                Logger.shared.write(key: "key\(i)", content: i)
                print("count \(i)")
            }
        }
        
        for i in 0..<101 {
             Logger.shared.read(for: "\(i)")
        }
        
        while Logger.shared.read(for: "100") != 100 {
            print("count ")
        }
    }
}
