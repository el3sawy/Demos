//
//  LoginViewController.swift
//  TestNavigation
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnPushOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPushOutlet.setTitle("ss", for: .normal)

        // Do any additional setup after loading the view.
    }

    @IBAction func pushTapped(_ sender: Any) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
