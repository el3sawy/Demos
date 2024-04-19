//
//  HomeViewController.swift
//  SmilesUnitTestDemo
//
//  Created by Ahmed Naguib on 14/01/2024.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func btn(_ sender: Any) {
        navigationController?.pushViewController(MainConfigurator.getListProduct(), animated: true)
    }
    
}
