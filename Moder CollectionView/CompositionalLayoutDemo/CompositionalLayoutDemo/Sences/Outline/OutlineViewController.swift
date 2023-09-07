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
    
    private func generateLayout() -> UICollectionViewLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }
}
