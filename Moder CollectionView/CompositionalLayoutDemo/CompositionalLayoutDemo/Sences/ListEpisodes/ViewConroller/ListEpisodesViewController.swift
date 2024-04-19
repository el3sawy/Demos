//
//  ListEpisodesViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 15/10/2022.
//

import UIKit
import Combine
//https://theswiftdev.com/working-with-diffable-data-sources-and-table-views-using-uikit/

class ListEpisodesViewController: UIViewController {
    
    // MARK: - Properties
    private var cancellable = Set<AnyCancellable>()
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = ListEpisodesViewModel()
    private let configCollection = CollectionViewDataSource()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = LayoutManager().createSections()
        collectionView.collectionViewLayout = layout
        
        fetchData()
        collectionView.backgroundColor = .white
        collectionView.dataSource = configCollection.dataSource(collectionView: collectionView)
    }
    
    
    private func fetchData() {
        viewModel.reloadCollectionView
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                let listSeries = self.viewModel.listSeries
                let listEpisodes = self.viewModel.listEpisodes
                self.configCollection.updateSnapShot(listEpisodes: listEpisodes, listSeries: listSeries)
            }.store(in: &cancellable)
        viewModel.fetchData()
    }
    
}
