//
//  TextFiledViewController.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

class TextFiledViewController: UIViewController {

    @IBOutlet weak var bll: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    private var bag = AppBag()
    
    deinit {
        print("TextFiledViewController deinit")
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        weCanMakeAlso()
        nameTextField.textPublisher.sink { text in
            print(text)
        }.store(in: &bag)
     
    }
    
    func weCanMakeAlso() {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: nameTextField)
            .compactMap({ ($0.object as? UITextField)?.text })
            .assign(to: \.text, on: bll)
            .store(in: &bag)
        
    }
}
