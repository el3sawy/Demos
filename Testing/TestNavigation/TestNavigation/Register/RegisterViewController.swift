//
//  RegisterViewController.swift
//  TestNavigation
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnRegsiterOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func btnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
