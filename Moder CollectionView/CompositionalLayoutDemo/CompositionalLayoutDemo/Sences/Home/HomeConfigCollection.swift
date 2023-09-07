//
//  HomeDataSource.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation
import UIKit

enum Section: CaseIterable {
    case main
}

class HomeConfigCollection {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ModernCollectionModel>
    typealias Cell = UICollectionView.CellRegistration<UICollectionViewListCell, ModernCollectionModel>
    
    var dataSource: DataSource!
    private var collectionExamples = ModernCollectionModel.load()
    
    private let homeCell = Cell { cell, indexPath, item in
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        cell.contentConfiguration = content
    }
    
    func createDataSource(with collectionView: UICollectionView) -> DataSource {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, item in
            guard let self = self else {
                return nil
            }
            return collectionView.dequeueConfiguredReusableCell(using: self.homeCell, for: indexPath, item: item)
        })
        return dataSource
    }
    
    func applySnapShot() {
        var snap = NSDiffableDataSourceSnapshot<Section, ModernCollectionModel>()
        snap.appendSections(Section.allCases)
        snap.appendItems(collectionExamples, toSection: .main)
        dataSource.apply(snap, animatingDifferences: true)
    }
}
