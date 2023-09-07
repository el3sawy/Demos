//
//  UnreadIndicator.swift
//  CompositionalEpisodes
//
//  Created by Ben Scheirman on 7/23/20.
//

import UIKit

class UnreadIndicator: UICollectionReusableView {
    static let reuseIdentifier = "unread-indicator-supplementary"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.systemBlue.setFill()
        UIBezierPath(ovalIn: bounds).fill()
    }
}
