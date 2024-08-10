//
//   UIView+Extension.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views : UIView...) {
        for view in views {addSubview(view) }
    }
    
    func pinToTheEdges(of superView : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
        ])
    }
}
