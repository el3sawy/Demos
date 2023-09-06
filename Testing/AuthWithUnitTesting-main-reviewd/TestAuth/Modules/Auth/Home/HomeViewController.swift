//
//  HomeViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var txtName: UILabel!
    private var name: String
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.text = name
    }

}
