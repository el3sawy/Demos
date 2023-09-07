//
//  ListViewController.swift
//  ModernConcurrency
//
//  Created by NTG on 26/08/2023.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  
    @IBOutlet var btn: UIView!
    
    @IBAction func btnTapped(_ sender: Any) {
        navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
}
