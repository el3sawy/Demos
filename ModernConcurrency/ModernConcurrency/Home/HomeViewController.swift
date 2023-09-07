//
//  HomeViewController.swift
//  ModernConcurrency
//
//  Created by Ahmed Elesawy on 16/11/2022.
//

import UIKit
import Combine
class HomeViewController: UIViewController {

    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var secondNameLbl: UILabel!
    private let viewModel = HomeViewModel()
    
    var appBag = AppBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bindLabels()
//        viewModel.loadData()
        DispatchQueue.main.async {
            print("1")
            DispatchQueue.global().sync {
                print("2")
            }
            print("3")
        }
        
        print(Thread.current)
        DispatchQueue.global(qos: .userInitiated).async {
            print(Thread.current)
        }
        
    }
    
    func bindLabels() {
        viewModel.$firstName.assign(to: \.text, on: firstNameLbl).store(in: &appBag)
        viewModel.$secondName.assign(to: \.text, on: secondNameLbl).store(in: &appBag)
    }
    
}
