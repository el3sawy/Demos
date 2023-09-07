//
//  UITextViewViewController.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

class UITextViewViewController: UIViewController {

    @IBOutlet weak var detailsTextView: UITextView!
    private var bag = AppBag()
    
    deinit {
        print("UITextViewViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsTextView.textPublisher.sink { value in
            print(value)
        }.store(in: &bag)
    }
}
