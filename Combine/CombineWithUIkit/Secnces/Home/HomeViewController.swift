//
//  HomeViewController.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textViewButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var ButtonDemo: UIButton!
    @IBOutlet weak var textFieldButton: UIButton!
    
    private var bag = AppBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldButton.tapPublisher.sink { [weak self] _ in
            self?.push(TextFiledViewController())
        }.store(in: &bag)
        
        textViewButton.tapPublisher.sink { [weak self] _ in
            self?.push(UITextViewViewController())
        }.store(in: &bag)
        
        ButtonDemo.tapPublisher.sink { [weak self] _ in
            self?.push(ButtonViewController())
        }.store(in: &bag)
        
        toggleButton.tapPublisher.sink { [weak self] _ in
            self?.push(UISwitchViewController())
        }.store(in: &bag)
        
        
    }
    
    
    private func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
