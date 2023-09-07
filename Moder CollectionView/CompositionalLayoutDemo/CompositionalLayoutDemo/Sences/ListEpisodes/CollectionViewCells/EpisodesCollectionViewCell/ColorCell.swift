//
//  ColorCell.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 17/10/2022.
//

import UIKit

class ColorCell: UICollectionViewCell {
    static let identifier = "ColorCell"
    
    var color: UIColor = .systemRed {
        didSet {
            contentView.backgroundColor = color
        }
    }
}
