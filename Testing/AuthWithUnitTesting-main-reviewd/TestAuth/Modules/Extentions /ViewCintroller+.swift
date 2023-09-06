//
//  ViewCintroller+.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    var toNavigation: UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
    
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}

// don not add extensions to UIViewController directly, it should be controlled by POP logic
// check this way

//conditional  conformance

protocol EasyNavigationProtocol {

    func showAlert(message: String)

    var toNavigation: UINavigationController { get }

    func push(_ vc: UIViewController)
}

extension EasyNavigationProtocol where Self: UIViewController {

    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    var toNavigation: UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }

    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }

}

class LoginController: UIViewController, EasyNavigationProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAlert(message: "fdf")
    }
}
