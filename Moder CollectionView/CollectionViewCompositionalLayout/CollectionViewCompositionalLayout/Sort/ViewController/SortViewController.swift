//
//  SortViewController.swift
//  
//
//  Created by Ahmed Naguib on 30/10/2023.
//

import UIKit

public class SortViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
//            let nib = UINib(nibName: "TextCollectionViewCell", bundle: .module)
//            collectionView.register(nib, forCellWithReuseIdentifier: "TextCollectionViewCell")
            
            
        }
    }
    
    var items: [String] =  [
    
    "Ahmed",
    "Ahmed Naguib",
    "Naguib",
    "Ahmed Naguib Mohamed",
    "Ahmed",
    "Ahmed Naguib",
    "Naguib",
    "Ahmed Naguib Mohamed",
    "Ahmed",
    "Ahmed Naguib",
    "Naguib",
    "Ahmed Naguib Mohamed",
    "Ahmed",
    "Ahmed Naguib",
    "Naguib",
    "Ahmed Naguib Mohamed",
    
    
    
    ]
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: String(describing: TextCollectionViewCell22.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TextCollectionViewCell22.self))
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.dataSource = self
        
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .absolute(32)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: layoutSize.heightDimension
            ),
            subitems: [.init(layoutSize: layoutSize)]
        )
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 8

        return UICollectionViewCompositionalLayout(section: section)
    }


    
    func createSecondSection() -> NSCollectionLayoutSection  {
        // Item
        let inset: CGFloat = 2.5
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(30), heightDimension: .absolute(50.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: 20, bottom: inset, trailing: 20)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        let group =  NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // Section
      
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .
        
        // Supplementary
        
//        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
//        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createSections(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch index {
        case 0: return createSecondSection()
        case 1: return createSecondSection()
        case 2: return createSecondSection()
        default: return createSecondSection()
        }
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout{ [weak self] (index, environment) -> NSCollectionLayoutSection? in
            return self?.createSections(index: index, environment: environment)
        }
        return layout
    }
    
}


 extension SortViewController: UICollectionViewDataSource {
     public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         items.count
    }
    
     public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCollectionViewCell22", for: indexPath) as! TextCollectionViewCell22

         cell.updateCell(with: items[indexPath.row])
//        cell.backgroundColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
        return cell
    }
}


