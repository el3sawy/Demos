//
//  LayoutManager.swift
//  AlgoliaSearch
//
//  Created by Ahmed Naguib on 09/05/2024.
//

import Foundation
import UIKit

class LayoutManager {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ [weak self] (index, _) -> NSCollectionLayoutSection? in
            return self?.categoryLayout()
        }
        return layout
    }
    func categoryLayout() -> NSCollectionLayoutSection {
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: .estimated(120),
            heightDimension: .absolute(40)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 5)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .estimated(120),
                heightDimension: .absolute(40)
            ),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
//      section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0) // 8 8
//        section.interGroupSpacing = 14
        section.orthogonalScrollingBehavior = .continuous
        let headerHeight: CGFloat = 80
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
}
