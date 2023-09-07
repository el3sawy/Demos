//
//  ListMountainsViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 08/11/2022.
//

import UIKit
import Combine

typealias AppBag = Set<AnyCancellable>

class ListMountainsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var searchTextFiled: UITextField!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let dataSource = MountainDataSource()
    private var subscriptions = AppBag()
    private var searchQuery = CurrentValueSubject<String, Never>("")
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        textFiledBind()
        performQuery()
    }
    
    // MARK: - Functions
    private func configCollectionView() {
        collectionView.collectionViewLayout = MountainLayout.createLayout()
        collectionView.dataSource = dataSource.create(with: collectionView)
        dataSource.listMountain = Mountain.load()
    }
    
    private func textFiledBind() {
        subscriptions = [searchTextFiled.bind(searchQuery)]
    }
    
    private func performQuery() {
        searchQuery.sink { [weak self] in
            self?.dataSource.listMountain = Mountain.search(by: $0)
        }
        .store(in: &subscriptions)
    }
}
