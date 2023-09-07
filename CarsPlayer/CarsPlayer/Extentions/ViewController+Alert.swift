//
//  ViewController+Alert.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 27/07/2022.
//

import UIKit

protocol PresentableAlert {
    func showAlertWithTextField(title: String, message: String, completion: @escaping (String) -> Void)
}

extension PresentableAlert where Self: UIViewController {
    func showAlertWithTextField(title: String, message: String, completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = message
        }
        
        alert.addAction(UIAlertAction(title: Localization.string(for: .ok), style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields?.first
            completion(textField?.text ?? "")
        }))
        present(alert, animated: true, completion: nil)
    }
}
