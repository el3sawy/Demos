//
//  CollectionViewDataSource.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 01/11/2022.
//

import UIKit

enum DataItem: Hashable {
    case episode(EpisodeModel)
    case series(SeriesModel)
}

enum SupplementarySection {
    static let section = "SupplementarySection"
}

final class CollectionViewDataSource {
    
    // MARK: - typealias
    typealias DataSource = UICollectionViewDiffableDataSource<SectionEpisode, DataItem>
    typealias Cell = UICollectionView.CellRegistration // 14
    private var cancellable = AppBag()
    // MARK: - Properties
    
    private var dataSource: DataSource!
    
    // MARK: - Cells
   private let episodeCellResignation = Cell<EpisodesCollectionViewCell, DataItem>(cellNib: EpisodesCollectionViewCell.nib) { cell, _, dataItem in
        if case .episode(let episode) = dataItem {
            cell.item = episode
        }
    }
    
   private let episodeCell = Cell<EpisodeCell, DataItem>(cellNib: EpisodeCell.nib) { cell, _, dataItem in
        if case .episode(let episode) = dataItem {
            cell.item = episode
        }
    }
    
   private let serialCell = Cell<SeriesCellCollectionViewCell, DataItem>(cellNib: SeriesCellCollectionViewCell.nib) { cell, _, dataItem in
        if case .series(let series) = dataItem {
            cell.item = series
        }
    }
    
    // MARK: - Functions
    func dataSource(collectionView: UICollectionView) -> DataSource {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, model in
            guard let self = self else {
                return nil
            }
            
            let section = SectionEpisode(rawValue: indexPath.section)
            switch section {
            case .feature:
                return collectionView.dequeueConfiguredReusableCell(using: self.episodeCellResignation, for: indexPath, item: model)
            case .recent:
                return collectionView.dequeueConfiguredReusableCell(using: self.episodeCell, for: indexPath, item: model)
            case .series:
                return collectionView.dequeueConfiguredReusableCell(using: self.serialCell, for: indexPath, item: model)
            case .none:
                return nil
            }
        })
        
        let sectionHeader = UICollectionView.SupplementaryRegistration<SectionHeader>(elementKind: SupplementarySection.section) { supplementaryView, elementKind, indexPath in
            let section = SectionEpisode(rawValue: indexPath.section)
            supplementaryView.item = section?.sectionName
        }
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            switch kind {
            case SupplementarySection.section:
                return collectionView.dequeueConfiguredReusableSupplementary(using: sectionHeader, for: indexPath)
            default:
                return nil
            }
        }
        return dataSource
    }
    
    
     func updateSnapShot(listEpisodes: [EpisodeModel], listSeries: [SeriesModel]) {
        var snap = NSDiffableDataSourceSnapshot<SectionEpisode, DataItem>()
        snap.appendSections(SectionEpisode.allCases)
        let recent = Array(listEpisodes.suffix(10)).map({DataItem.episode($0)})
        let episodes = listEpisodes.map({ DataItem.episode($0) })
        snap.appendItems(episodes, toSection: .feature)
        snap.appendItems(recent, toSection: .recent)
        snap.appendItems(listSeries.map({ DataItem.series($0) }), toSection: .series)
         
        dataSource.apply(snap, animatingDifferences: true)
    }
}


