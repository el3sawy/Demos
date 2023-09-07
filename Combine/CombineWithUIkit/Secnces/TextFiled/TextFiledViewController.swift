//
//  TextFiledViewController.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

class TextFiledViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    private var bag = AppBag()
    
    deinit {
        print("TextFiledViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.textPublisher.sink { text in
            print(text)
        }.store(in: &bag)
     
    }
}
