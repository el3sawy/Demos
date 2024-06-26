//
//  BaseViewController.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import UIKit.UIViewController

public class BaseViewController: UIViewController {
    
    let router: RouterProtocol = Router()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        router.presentedView = self
    }
    
    public func setupNavigationBar(title: String? = nil, backTitle: String = "", rightBarButtonItem: UIBarButtonItem? = nil) {
        guard navigationController != nil else { return }
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: backTitle, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
