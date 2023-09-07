//
//  MainRouter.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation
import UIKit

protocol MainRouter {
    var sourceViewController: UIViewController? {get set}
    
    func dismissMe()
    func popMe()
    func push(_ viewController: UIViewController)
    func presentViewController(_ viewController: UIViewController)
    func showAlert(message: String)
}

extension MainRouter {
    func dismissMe() {
        sourceViewController?.dismiss(animated: true, completion: nil)
    }
    func popMe() {
        sourceViewController?.navigationController?.popViewController(animated: true)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
    func push(_ viewController: UIViewController) {
        sourceViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    func presentViewController(_ viewController: UIViewController) {
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
}
