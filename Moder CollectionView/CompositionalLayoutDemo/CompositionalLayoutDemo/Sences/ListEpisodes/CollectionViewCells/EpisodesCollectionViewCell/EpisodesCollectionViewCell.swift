//
//  EpisodesCollectionViewCell.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 16/10/2022.
//

import UIKit

class EpisodesCollectionViewCell: UICollectionViewCell {

    static let identifier = "EpisodesCollectionViewCell"
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCourse: RemoteImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCourse.layer.cornerRadius = 14
    }
    
    var item: EpisodeModel? {
        didSet {

            titleLabel.text = item?.title
            imageCourse.load(with: URL(string: item?.medium_artwork_url ?? ""))
        }
    }

}
