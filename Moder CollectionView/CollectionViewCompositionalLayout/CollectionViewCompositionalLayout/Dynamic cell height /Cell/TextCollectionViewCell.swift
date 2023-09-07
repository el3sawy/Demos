//
//  TextCollectionViewCell.swift
//  CollectionViewCompositionalLayout
//
//  Created by Ahmed Elesawy on 13/10/2022.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var item: String? {
        didSet {
            lblText.text = item
        }
    }

}
