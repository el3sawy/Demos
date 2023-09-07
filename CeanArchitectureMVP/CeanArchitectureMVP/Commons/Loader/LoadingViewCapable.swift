//
//  LoadingViewCapable.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation
import UIKit

protocol LoadingViewCapable: AnyObject {
    func showLoader()
    func hideLoader()
}

extension LoadingViewCapable where Self: UIViewController {
    func showLoader() {
        let loader = LoadingView.shared
        view.addSubview(loader)
        view.bringSubviewToFront(loader)
        loader.layer.cornerRadius = 10
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loader.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loader.activityIndicator.startAnimating()
    }
    func hideLoader() {
        let loader = LoadingView.shared
        loader.removeFromSuperview()
    }
}
