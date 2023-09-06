//
//  Button.swift
//  TimerTest
//
//  Created by Ahmed Elesawy on 18/01/2022.
//

import UIKit

class ButtonCustome: UIButton {
    
    public let loadingView = UIActivityIndicatorView()
    
    public var isLoading: Bool = true {
        didSet {
            isEnabled = !isLoading
            if isLoading { loadingView.startAnimating() }
            else { loadingView.stopAnimating() }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemBlue
        layer.cornerRadius = 8
        contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)
        
        loadingView.color = .red
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 24),
            loadingView.widthAnchor.constraint(equalTo: loadingView.heightAnchor)
        ])
        isLoading = true
    }
    
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        super.setTitle("", for: .disabled)
    }

    
}
