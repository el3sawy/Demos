//
//  MountainDataSource.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 09/11/2022.
//
//https://www.biteinteractive.com/collection-view-lists-in-ios-14-part-2/
import Combine
import UIKit

final class MountainDataSource {
    
    typealias  DataSource = UICollectionViewDiffableDataSource<Section, String>
    typealias CellRegistration = UICollectionView.CellRegistration<MountainsCollectionViewCell, String>
    
    // MARK: - Properties
    private var dataSource: DataSource!
    @Published var listMountain: [String] = []
    private var subscriptions = AppBag()
    
    // MARK: - Init
    init() {
        $listMountain
            .map { !$0.isEmpty }
            .sink { [weak self] hasValue in
                if hasValue { self?.applySnapShot() }
            }.store(in: &subscriptions)
    }
    
    // MARK: - Functions
    private let mountainCell = CellRegistration(cellNib: MountainsCollectionViewCell.nib) { cell, _, mountainName in
        cell.item = mountainName
//        cell.accessories = [.multiselect()]
//        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
//        /* Set a beige background color to use the cell's tint color. */
//        backgroundConfig.backgroundColor = .lightGray
//        backgroundConfig.strokeColor = .green
//        cell.backgroundConfiguration = backgroundConfig
    }
    
    func create(with collectionView: UICollectionView) -> DataSource  {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, mountainName in
            return collectionView.dequeueConfiguredReusableCell(using: self.mountainCell, for: indexPath, item: mountainName)
        })
//        dataSource.reorderingHandlers.canReorderItem = { item in return true }
        return dataSource
    }
    
    private func applySnapShot() {
        var snap = NSDiffableDataSourceSnapshot<Section, String>()
        snap.appendSections(Section.allCases)
        snap.appendItems(listMountain, toSection: .main)
        dataSource.apply(snap, animatingDifferences: true)
    }
}
