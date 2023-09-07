//
//  LayoutManager.swift
//  CompositionalEpisodes
//
//  Created by Ben Scheirman on 7/23/20.
//

import UIKit

struct LayoutManager {
    
    enum DecorationKind {
        static let seriesBackground = "decoration-series-background"
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
         
            guard let sectionKind = ViewController.Section(rawValue: sectionIndex) else {
                fatalError("Undefined section for value: \(sectionIndex)")
            }
            
            switch sectionKind {
            case .featured:
                return createFeaturedSection(layoutEnvironment)
                
            case .recent:
                return createRecentSection(layoutEnvironment)
                
            case .series:
                return createSeriesSection()
                
            case .remaining:
                return createRemainingEpisodesSection()
            }
        }
        
        layout.register(SeriesBackgroundDecoration.self, forDecorationViewOfKind: DecorationKind.seriesBackground)
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 40
        layout.configuration = configuration
        
        return layout
    }
    
    func createFeaturedSection(_ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize
        if layoutEnvironment.container.contentSize.width > 600 {
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .estimated(340))
        } else {
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(250))
        }
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    func createRecentSection(_ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [createUnreadSupplementaryItem()])
        
        let groupSize: NSCollectionLayoutSize
            
        if layoutEnvironment.container.contentSize.width > 600 {
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .absolute(240))
        } else {
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(240))
        }
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeaderSupplementary()]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func createUnreadSupplementaryItem() -> NSCollectionLayoutSupplementaryItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(20), heightDimension: .absolute(20))
        
        let anchor = NSCollectionLayoutAnchor(edges: [.top, .leading], fractionalOffset: CGPoint(x: -0.3, y: -0.3))
        
        let item = NSCollectionLayoutSupplementaryItem(layoutSize: itemSize, elementKind: ViewController.SupplementaryElementKind.unreadIndicator, containerAnchor: anchor)
        
        return item
    }
    
    func createSectionHeaderSupplementary() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: ViewController.SupplementaryElementKind.sectionHeader, alignment: .top)

        return headerSupplementary
    }
    
    func createRemainingEpisodesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [createUnreadSupplementaryItem()])
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeaderSupplementary()]

        return section
    }
    
    func createSeriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(230), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [createSectionHeaderSupplementary()]
        
        section.decorationItems = [
            NSCollectionLayoutDecorationItem.background(elementKind: DecorationKind.seriesBackground)
        ]
        
        return section
    }
}
