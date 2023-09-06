//
//  ErrorViewController.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import UIKit

protocol ErrorProtocol: class {
    func reloadData()
}
class ErrorViewController: UIViewController {

    weak var deleget: ErrorProtocol?
    @IBOutlet weak var btnReteryAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customeButton()
    }
    private func customeButton() {
        btnReteryAgain.layer.cornerRadius = 15
        btnReteryAgain.layer.borderWidth = 0.4
        btnReteryAgain.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func btnButttonTapped(_ sender: Any) {
        deleget?.reloadData()
        dismiss(animated: false, completion: nil)
    }

}
