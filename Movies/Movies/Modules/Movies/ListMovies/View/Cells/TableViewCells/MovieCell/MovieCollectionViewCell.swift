//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var movieReleaseYearLabel: UILabel!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    // MARK: - Functions
    func configCell(with movie: MovieUIModel) {
        movieReleaseYearLabel.text = movie.year
        movieNameLabel.text = movie.name
        movieImage.load(with: movie.imageURL)
    }
}
