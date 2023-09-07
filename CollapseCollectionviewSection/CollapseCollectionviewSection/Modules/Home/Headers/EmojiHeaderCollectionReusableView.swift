//
//  EmojiHeaderCollectionReusableView.swift
//  CollapseCollectionviewSection
//
//  Created by Ahmed Elesawy on 29/09/2021.
//

import UIKit

class EmojiHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    // MARK: - Variables
    var didTappedHeader: (() -> Void)?
    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: Any) {
       didTappedHeader?()
    }
}
