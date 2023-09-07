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
    var previousIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        collectionView.dataSource = configCollection.createDataSource(with: collectionView)
        collectionView.delegate = self
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }
}

extension OutlineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var snap = configCollection.dataSource.snapshot()
        guard var currentItem = configCollection.dataSource.itemIdentifier(for: indexPath)
            else { return }
        
        if let prevoius = previousIndex {
            var previousItem = configCollection.dataSource.itemIdentifier(for: prevoius)!
            snap.deleteItems([previousItem])
            let nextItemIndexPath1 = IndexPath(item: prevoius.item + 1, section: prevoius.section)
            let nextItem = configCollection.dataSource.itemIdentifier(for: nextItemIndexPath1)!
            
            previousItem.isSelected = false
            snap.insertItems([previousItem], beforeItem: nextItem)
            configCollection.dataSource.apply(snap)
        }
    
      
       
        
        snap.deleteItems([currentItem])
        currentItem.isSelected = true
        let nextItemIndexPath = IndexPath(item: indexPath.item + 1, section: indexPath.section)
        let nextItem = configCollection.dataSource.itemIdentifier(for: nextItemIndexPath)!
        snap.insertItems([currentItem], beforeItem: nextItem)
        configCollection.dataSource.apply(snap)

        
        previousIndex = indexPath
    }
    
//    func update(currentItem: OutlineItem) {
//
//        snap.deleteItems([currentItem])
//        let nextItemIndexPath = IndexPath(item: indexPath.item + 1, section: indexPath.section)
//        snap.insertItems([currentItem], beforeItem: nextItem)
//    }
}
