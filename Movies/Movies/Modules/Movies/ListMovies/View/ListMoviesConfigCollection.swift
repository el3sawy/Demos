//
//  ListMoviesConfigCollection.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import UIKit

final class ListMoviesConfigCollection {
    
    // MARK: - Typealias
    typealias DataSource = UICollectionViewDiffableDataSource<Section, MovieUIModel>
    typealias Cell = UICollectionView.CellRegistration<MovieCollectionViewCell, MovieUIModel>
    
    // MARK: - Properties
    var dataSource: DataSource!
    
    private let movieCell = Cell(cellNib: MovieCollectionViewCell.nib) { (cell, _, model) in
        cell.configCell(with: model)
    }
    
    // MARK: - Functions
    func createDataSource(collectionView: UICollectionView) -> DataSource {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, model in
            guard let self = self else {
                return nil
            }
            return collectionView.dequeueConfiguredReusableCell(using: self.movieCell, for: indexPath, item: model)
        })
        return dataSource
    }
    
    func updateSnapShot(with movies: [MovieUIModel]) {
        var snap = NSDiffableDataSourceSnapshot<Section, MovieUIModel>()
        snap.appendSections(Section.allCases)
        snap.appendItems(movies, toSection: .main)
        dataSource.apply(snap, animatingDifferences: true)
    }
}

