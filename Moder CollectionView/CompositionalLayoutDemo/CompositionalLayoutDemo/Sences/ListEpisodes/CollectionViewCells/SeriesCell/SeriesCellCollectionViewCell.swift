//
//  SeriesCellCollectionViewCell.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 30/10/2022.
//

import UIKit

class SeriesCellCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    static let identifier = "SeriesCellCollectionViewCell"
    var item: SeriesModel? {
        didSet {
            titleLabel.text = item?.name
            descriptionLabel.text = item?.description
        }
    }
}
