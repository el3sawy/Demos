//
//  CategoryCollectionViewCell.swift
//  AlgoliaSearch
//
//  Created by Ahmed Naguib on 09/05/2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with category: String) {
        lbl.text = category
    }

}
