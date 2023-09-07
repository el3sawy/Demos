//
//  SectionHeader.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 26/10/2022.
//

import Foundation
import UIKit

class SectionHeader: UICollectionReusableView {
    
    let identifier = "SectionHeader"
    
    private let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
        backgroundColor = .lightGray.withAlphaComponent(0.2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var item: String? {
        didSet {
            label.text = item
        }
    }
    
    private func config() {
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            label.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -1),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
