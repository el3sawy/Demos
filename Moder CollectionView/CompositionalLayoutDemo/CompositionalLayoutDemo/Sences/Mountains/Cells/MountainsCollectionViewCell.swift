//
//  MountainsCollectionViewCell.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 08/11/2022.
//

import UIKit

class MountainsCollectionViewCell: UICollectionViewListCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var item: String? {
        didSet {
            nameLabel.text = item
            nameLabel.layer.borderWidth = 0.5
            nameLabel.layer.borderColor = UIColor.label.cgColor
        }
    }
    
    
//    override func updateConfiguration(using state: UICellConfigurationState) {
//        guard let cv = self.backgroundConfiguration?.customView else { return }
//        if state.isSelected || state.isHighlighted {
//            // what?
////            if cv.subviews.count == 0 {
//                let sel = UIView()
//                sel.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
//                sel.frame = cv.bounds
//                sel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                cv.addSubview(sel)
////            }
//        } else {
//            cv.subviews.first?.removeFromSuperview()
//        }
//        super.updateConfiguration(using:state)
//    }
}
