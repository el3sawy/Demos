//
//  TableViewDemoViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 13/11/2022.
//

import UIKit

class TableViewDemoViewController: UIViewController {

    private var collectionView: UICollectionView!
    private  var isEditable = false
    private let configSubject = ConfigSubjectCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationItem.rightBarButtonItem = self.editButtonItem
        collectionView.dataSource = configSubject.createDataSource(with: collectionView)
        configSubject.applySnapShot()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        collectionView.isEditing = editing
        collectionView.allowsMultipleSelectionDuringEditing = editing
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    private func setupLayout() -> UICollectionViewCompositionalLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.trailingSwipeActionsConfigurationProvider = { indexPath in
            let del = UIContextualAction(style: .destructive, title: "Delete") {
                [weak self] action, view, completion in
                self?.configSubject.delete(at: indexPath)
                completion(true)
            }
            return UISwipeActionsConfiguration(actions: [del])
        }
        
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}
