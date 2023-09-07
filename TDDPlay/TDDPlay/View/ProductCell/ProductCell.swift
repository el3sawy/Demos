//
//  ProductCell.swift
//  TDDPlay
//
//  Created by NTG on 07/06/2023.
//

import UIKit

class ProductCell: UITableViewCell {

    static let identifier = String(describing: ProductCell.self)
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    
    var item: ProductUiModel! {
        didSet {
            titleLabel.text = item.title
            subTitleLabel.text = item.subTitle
            productImage.backgroundColor = .red
        }
    }
}



struct ProductUiModel: Equatable {
    var title: String
    var subTitle: String
    var imageURL: String
}

