//
//  PresentableAlert.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation
import UIKit

protocol PresentableAlert {
    func showAlert(with message: String)
}

extension PresentableAlert where Self: UIViewController {
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
