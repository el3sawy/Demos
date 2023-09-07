//
//  ListMoviesViewController.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import UIKit

final class ListMoviesViewController: UIViewController, LoadingViewCapable, PresentableAlert, NavigationRoute {
    
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let viewModel: ListMoviesViewModel
    private let config = ListMoviesConfigCollection()
    private var cancellables = AppBag()
    
    // MARK: - Init
    init(viewModel: ListMoviesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        bindCollectionView()
        addLoader()
        bindErrorMessage()
        title = Messages.listMovies.rawValue
    }
    
    // MARK: - Functions
    private func configCollectionView() {
        collectionView.prefetchDataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = ListMoviesLayout.createLayout()
        collectionView.dataSource = config.createDataSource(collectionView: collectionView)
    }
    
    private func bindCollectionView() {
        viewModel.$movies.sink { [weak self] movies in
            self?.config.updateSnapShot(with: movies)
        }.store(in: &cancellables)
    }
    
    private func addLoader() {
        viewModel
            .$showLoader
            .sink { [weak self] showLoader in
                showLoader ? self?.showLoader() : self?.hideLoader()
            }.store(in: &cancellables)
    }
    
    private func bindErrorMessage() {
        viewModel.$errorMessage
            .sink(receiveValue: showErrorMessage)
            .store(in: &cancellables)
    }
    
    private func showErrorMessage(_ message: String) {
        showAlert(with: message)
    }
}

// MARK: - DataSourcePrefetching
extension ListMoviesViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            if indexPath.row >= viewModel.movies.count - 5 {
                viewModel.fetchMoviesWithPagination()
                break
            }
        }
    }
}

// MARK: - CollectionViewDelegate
extension ListMoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = config.dataSource.itemIdentifier(for: indexPath)?.movieId else {
            return
        }
        navigate(to: MoviesRouter.details(id: id))
    }
}
