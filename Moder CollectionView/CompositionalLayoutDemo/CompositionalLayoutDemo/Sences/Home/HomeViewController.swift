//
//  HomeViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let configCollection = HomeConfigCollection()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Modern collectionView"
        setupCollectionView()
        collectionView.dataSource = configCollection.createDataSource(with: collectionView)
        configCollection.applySnapShot()
        collectionView.delegate = self
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    private func setupLayout() -> UICollectionViewCompositionalLayout{
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

// MARK: - Collection view delegate
extension HomeViewController: UICollectionViewDelegate, Pushable {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let type = configCollection.dataSource.itemIdentifier(for: indexPath)?.type else {
            return
        }
        
        switch type {
        case .network:
            push(ListEpisodesViewController())
        case .search:
            push(ListMountainsViewController())
        case .expand:
            push(OutlineViewController())
        case .tableView:
            push(TableViewDemoViewController())
        }
    }
}
