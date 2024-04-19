//
//  TextCollectionViewCell22.swift
//  
//
//  Created by Ahmed Naguib on 30/10/2023.
//

import UIKit

class TextCollectionViewCell22: UICollectionViewCell {

    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(with title: String) {
        lbl.text = title
        lbl.backgroundColor = .red
        
        contentView.backgroundColor = .blue
    }

}
