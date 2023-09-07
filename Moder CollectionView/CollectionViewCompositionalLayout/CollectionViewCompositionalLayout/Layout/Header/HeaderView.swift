//
//  HeaderView.swift
//  CollectionViewCompositionalLayout
//
//  Created by Ahmed Elesawy on 13/10/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {

    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var title: String? {
        didSet {
            lblTitle.text = title
        }
    }
    
}
