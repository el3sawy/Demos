//
//  WishListViewController.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

class WishListViewController: UIViewController {

    private unowned let Coordinator: WishListCoordinatorProcol
    
    init(Coordinator: WishListCoordinatorProcol) {
        self.Coordinator = Coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
