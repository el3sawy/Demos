//
//  ViewController.swift
//  Graph
//
//  Created by Ahmed Elesawy on 08/03/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyRate.find(pair: "" , rates: ["GBPRUB": 100, "USDGBP": 0.7, "GBPEUR": 0.83, "EURRUB": 86.3])
        
    }


}

