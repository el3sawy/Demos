//
//  SettingViewController.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

class SettingViewController: UIViewController {

    private unowned let coordinator: SettingCoordinator
    
    @IBOutlet weak var btnLoginOutlets: UIButton!
    init(coordinator: SettingCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let isLogin = LocalStorage.shared.isLogin
        let text = isLogin ? "Logout" : "Login"
        btnLoginOutlets.setTitle(text, for: .normal)
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        coordinator.login()
    }
    
}
