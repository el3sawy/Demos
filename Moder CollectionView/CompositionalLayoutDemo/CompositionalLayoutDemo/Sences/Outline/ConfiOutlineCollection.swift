//
//  ConfiOutlineCollection.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import Foundation
import UIKit

class ConfigOutlineCollection {
    
    enum Section {
        case main
    }
    
    // MARK: - Typealias
    typealias Cell = UICollectionView.CellRegistration<UICollectionViewListCell, OutlineItem>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, OutlineItem>
    
    // MARK: - Propitiates
    private var dataSource: DataSource!
    
    // MARK: - Cells
    let containerCellRegistration = Cell { (cell, indexPath, menuItem) in
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = menuItem.title
        contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .headline)
        cell.contentConfiguration = contentConfiguration
        
        let disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
        cell.accessories = [.outlineDisclosure(options: disclosureOptions)]
        //cell.backgroundConfiguration = UIBackgroundConfiguration.clear()
        
    }
    
    let cellRegistration = Cell{ cell, indexPath, menuItem in
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = menuItem.title
        contentConfiguration.textProperties.color = .darkGray
        cell.contentConfiguration = contentConfiguration
        cell.backgroundConfiguration = UIBackgroundConfiguration.clear()
    }
    
    // MARK: - Functions
    func createDataSource(with collectionView: UICollectionView) -> DataSource {
        
        dataSource = UICollectionViewDiffableDataSource<Section, OutlineItem>(collectionView: collectionView) { [weak self]
            (collectionView: UICollectionView, indexPath: IndexPath, item: OutlineItem) -> UICollectionViewCell? in
            // Return the cell.
            guard let self = self else {
                return nil
            }
            
            if item.subitems.isEmpty {
                return collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: self.containerCellRegistration, for: indexPath, item: item)
            }
        }
        
        // load our initial data
        let snapshot = initialSnapshot()
        dataSource.apply(snapshot, to: .main, animatingDifferences: false)
        return dataSource
    }
    
   private func initialSnapshot() -> NSDiffableDataSourceSectionSnapshot<OutlineItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<OutlineItem>()
        
        func addItems(_ menuItems: [OutlineItem], to parent: OutlineItem?) {
            snapshot.append(menuItems, to: parent)
            for menuItem in menuItems where !menuItem.subitems.isEmpty {
                addItems(menuItem.subitems, to: menuItem)
            }
        }
        addItems(OutlineItem.load(), to: nil)
        return snapshot
    }
    
}
