//
//  MountainLayout.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 08/11/2022.
//

import Foundation
import UIKit

final class MountainLayout {
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, layoutEnvironment in
            return createMountainSection(layoutEnvironment)
        }
    }
    
    private static func createMountainSection(_ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension:.absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // Group
        let numberOfItems = layoutEnvironment.container.contentSize.width > 600 ? 3 : 2
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: numberOfItems)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
