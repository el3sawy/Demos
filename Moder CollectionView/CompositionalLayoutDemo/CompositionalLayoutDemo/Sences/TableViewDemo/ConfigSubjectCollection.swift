//
//  CongigSubjectCollection.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation
import UIKit

class ConfigSubjectCollection {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, SubjectModel>
    typealias Cell = UICollectionView.CellRegistration<UICollectionViewListCell, SubjectModel>
    var snap = NSDiffableDataSourceSnapshot<Section, SubjectModel>()
    var dataSource: DataSource!
    private var subjects = SubjectModel.load()
    
    private let subjectCell = Cell { cell, indexPath, item in
        var content = cell.defaultContentConfiguration()
        content.text = item.name


        cell.contentConfiguration = content
        cell.backgroundConfiguration = UIBackgroundConfiguration.clear()
        cell.accessories = [.delete(), .reorder()]
    }
    
    func createDataSource(with collectionView: UICollectionView) -> DataSource {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, item in
            guard let self = self else {
                return nil
            }
            return collectionView.dequeueConfiguredReusableCell(using: self.subjectCell, for: indexPath, item: item)
        })
        dataSource.reorderingHandlers.canReorderItem = { item in return true }
        return dataSource
    }
    
    func applySnapShot() {
        snap.appendSections(Section.allCases)
        snap.appendItems(subjects, toSection: .main)
        dataSource.apply(snap, animatingDifferences: true)
    }
    
    func delete(at ip: IndexPath) {
        var snap = dataSource.snapshot()
        if let ident = dataSource.itemIdentifier(for: ip) {
            snap.deleteItems([ident])
        }
        dataSource.apply(snap)
    }
}
