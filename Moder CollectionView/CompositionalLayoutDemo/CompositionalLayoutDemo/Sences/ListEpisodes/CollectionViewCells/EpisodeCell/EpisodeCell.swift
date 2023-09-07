//
//  EpisodeCell.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 26/10/2022.
//

import UIKit

class EpisodeCell: UICollectionViewCell {

    static let identifier = "EpisodeCell"
    
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCourse: RemoteImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCourse.layer.cornerRadius = 14
        backgroundColor = .clear
    }
    
    var item: EpisodeModel! {
        didSet {

            titleLabel.text = item.title
            imageCourse.load(with: URL(string: item.medium_artwork_url ?? ""))
        }
    }

}
