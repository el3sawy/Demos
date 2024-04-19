//
//  OutlineViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 09/11/2022.
//

import UIKit

class OutlineViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let configCollection = ConfigOutlineCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        collectionView.dataSource = configCollection.createDataSource(with: collectionView)
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
//    private func generateLayout() -> UICollectionViewLayout {
//        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
//        return layout
//    }
    private func generateLayout() -> UICollectionViewLayout {
        // Define list configuration
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
        
        // Create layout with list configuration
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }
    
    private func generateLayouet() -> UICollectionViewLayout {
        // Define the item size for the grid section
        let gridItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let gridItem = NSCollectionLayoutItem(layoutSize: gridItemSize)

        // Define the group for the grid section
        let gridGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        let gridGroup = NSCollectionLayoutGroup.horizontal(layoutSize: gridGroupSize, subitem: gridItem, count: 5)

        // Create the section for the grid
        let gridSection = NSCollectionLayoutSection(group: gridGroup)
        gridSection.orthogonalScrollingBehavior = .groupPaging

        // Define the item size for the expandable/collapsible section
        let expandableItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))

        // Define the group for the expandable/collapsible section
        let expandableGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let expandableGroup = NSCollectionLayoutGroup.vertical(layoutSize: expandableGroupSize, subitems: [NSCollectionLayoutItem(layoutSize: expandableItemSize)])

        // Create the section for the expandable/collapsible section
        let expandableSection = NSCollectionLayoutSection(group: expandableGroup)
        expandableSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        expandableSection.interGroupSpacing = 20

        // Define the compositional layout
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return gridSection
            } else {
                return expandableSection
            }
        }

        return layout
    }

}

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the collection view layout
        let layout = generateLayout()
        
        // Create a UICollectionView with the specified layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        
        // Register cells
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Set the data source
        collectionView.dataSource = self
        
        // Add the collection view to the view hierarchy
        view.addSubview(collectionView)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // We have two sections in this example
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return number of items based on section
        return section == 0 ? 20 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = indexPath.section == 0 ? .blue : .green
        return cell
    }
    
    // MARK: - Compositional Layout
    
    private func generateLayout() -> UICollectionViewLayout {
        // Define the item size for the grid section
        let gridItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let gridItem = NSCollectionLayoutItem(layoutSize: gridItemSize)

        // Define the group for the grid section
        let gridGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        let gridGroup = NSCollectionLayoutGroup.horizontal(layoutSize: gridGroupSize, subitem: gridItem, count: 5)

        // Create the section for the grid
        let gridSection = NSCollectionLayoutSection(group: gridGroup)
        gridSection.orthogonalScrollingBehavior = .groupPaging

        // Define the item size for the expandable/collapsible section
        let expandableItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))

        // Define the group for the expandable/collapsible section
        let expandableGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let expandableGroup = NSCollectionLayoutGroup.vertical(layoutSize: expandableGroupSize, subitems: [NSCollectionLayoutItem(layoutSize: expandableItemSize)])

        // Create the section for the expandable/collapsible section
        let expandableSection = NSCollectionLayoutSection(group: expandableGroup)
        expandableSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        expandableSection.interGroupSpacing = 20
        
        

        // Define the compositional layout
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return gridSection
            } else {
                
                return expandableSection
            }
        }

        return layout
    }
}
