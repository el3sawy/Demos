//
//  LoadingView.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation
import UIKit

class LoadingView: UIView {
    static let shared = LoadingView()
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tintColor = .blue
        activityIndicator.color = .black
        return activityIndicator
    }()
    
    private init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        addSubview(activityIndicator)
        backgroundColor = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    required init?(coder: NSCoder) {
        return nil
    }
}
