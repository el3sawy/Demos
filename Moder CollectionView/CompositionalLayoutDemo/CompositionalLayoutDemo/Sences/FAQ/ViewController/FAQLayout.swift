//
//  FAQLayout.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Naguib on 22/02/2024.
//

import UIKit
extension FAQLayout {
    enum Section: Int {
        case offers = 0
        case faqs = 1
    }
}

final class FAQLayout {
    
    func create() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            let type = Section(rawValue: sectionIndex) ?? .faqs
            
            switch type {
            case .offers:
                return self?.offersLayout(layoutEnvironment)
            case .faqs:
                return self?.faqsLayout()
            }

        }
        // Layout
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 0
        layout.configuration = configuration
        
        return layout
    }
    
    private func faqsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        //      let group = NSCollectionLayoutGroup(layoutSize: groupSize)
        let section = NSCollectionLayoutSection(group: group)
        //    section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        section.boundarySupplementaryItems = [createHeaderItem()]
        
        return section
    }
    
    private func offersLayout(_ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        // First item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(layoutEnvironment.container.contentSize.width / 3), heightDimension: .absolute(210))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.boundarySupplementaryItems = [createHeaderItem()]
        return section
    }
    
    private func createHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        header.pinToVisibleBounds = true
        return header
    }
    
}
