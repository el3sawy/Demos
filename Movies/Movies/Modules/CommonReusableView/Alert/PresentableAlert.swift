//
//  PresentableAlert.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import Foundation
import UIKit

protocol PresentableAlert {
    func showAlert(with message: String)
}

extension PresentableAlert where Self: UIViewController {
    func showAlert(with message: String) {
        guard !message.isEmpty else { return }
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
