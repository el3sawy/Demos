//
//  HomeViewController.swift
//  Barcode
//
//  Created by Ahmed Elesawy on 09/01/2022.
//

import UIKit
protocol HomeViewControllerProtocol: AnyObject {
    func didSuccess(message: String)
    func didError(message: String)
}

class HomeViewController: UIViewController {

    var delegate: HomeViewControllerProtocol
    init(delegate:  HomeViewControllerProtocol) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSuccess(_ sender: Any) {
        delegate.didSuccess(message: "Success Message")
    }
    
    @IBAction func btnError(_ sender: Any) {
        delegate.didError(message: "Error Message")
    }
}
