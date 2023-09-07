//
//  UISwitchViewController.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

class UISwitchViewController: UIViewController {

    @IBOutlet weak var switchType: UISwitch!
    
    private var bag = AppBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        switchType.switchPublisher.sink { isOn  in
            print(isOn)
        }.store(in: &bag)
        
    }
    
    deinit {
        print("UISwitchViewController deinit")
    }

}
