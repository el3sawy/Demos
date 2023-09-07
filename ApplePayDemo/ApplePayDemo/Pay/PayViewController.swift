//
//  PayViewController.swift
//  ApplePayDemo
//
//  Created by NTG on 04/07/2023.
//

import UIKit

class PayViewController: UIViewController {

    let viewModel = AppleSignInViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnPay(_ sender: Any) {
        viewModel.attemptSignIn()
    }
    
}
