//
//  ListPostsViewController.swift
//  ModerConurrenctTest
//
//  Created by Ahmed Elesawy on 04/01/2023.
//

import UIKit

class ListPostsViewController: UIViewController {
    
    // MARK: - Properties
    private var collectionView: UICollectionView!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    private func setLayout() -> UICollectionViewLayout {
        let listCollection = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: listCollection)
    }
}

