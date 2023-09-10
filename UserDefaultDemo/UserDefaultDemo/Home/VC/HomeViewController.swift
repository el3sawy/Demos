//
//  HomeViewController.swift
//  UserDefaultDemo
//
//  Created by NTG on 10/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    let hedaerHome = ViewHeader()
    let hedaerHom2e = ViewHeader()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.backgroundColor = .red
        stackView.addArrangedSubview(hedaerHome)
        stackView.addArrangedSubview(hedaerHom2e)
        stackView.addArrangedSubview(UIView())

    }

}
