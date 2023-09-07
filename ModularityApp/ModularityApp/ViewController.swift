//
//  ViewController.swift
//  ModularityApp
//
//  Created by Ahmed Elesawy on 15/08/2022.
//

import UIKit
//import Models
import NetworlLayer
//import AuthLogin
import TestModule
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
//        let user = UserModel(name: "Ahmed", address: "Cairo")
//        print(user)
//
//        let name = NetworkManger.request()
//        print(name)
        setUpButton()
//        let _ = testAAA()
        let _ = RegisViewController()
    }
    
    func setUpButton() {
        let button  = UIButton()
        button.setTitle("Login", for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
    }
    
    @objc func tapped() {
//        Login()
        navigationController?.pushViewController(RegisViewController(), animated: true)
        print("Tapped")
    }
}

