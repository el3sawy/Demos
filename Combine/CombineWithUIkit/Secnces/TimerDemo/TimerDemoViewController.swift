//
//  TimerDemoViewController.swift
//  CombineWithUIkit
//
//  Created by NTG on 11/09/2023.
//

import UIKit
import Combine

class TimerDemoViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    private var bag = AppBag()
    let timer = Timer
        .publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
    }
    
    
    func createTimer() {
        timer
            .scan(0, { (count, _) in
                return count + 1
            })
            .sink { count in
                self.lbl.text = "\(count)"
            }
            .store(in: &bag)
        
    }
    
    @IBAction func btnStart(_ sender: Any) {
       
    }
    
    @IBAction func btnStop(_ sender: Any) {
        timer.upstream.connect().cancel()
    }
    
   
    
}
