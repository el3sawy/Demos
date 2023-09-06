//
//  ViewController+.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import UIKit

extension UIViewController {
    func alertButton(message:String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorVC(deleget: ErrorProtocol) {
        let vc = ErrorViewController()
        vc.deleget = deleget
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}
