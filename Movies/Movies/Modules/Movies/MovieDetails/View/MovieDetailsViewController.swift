//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Ahmed Elesawy on 09/12/2022.
//

import UIKit

final class MovieDetailsViewController: UIViewController, LoadingViewCapable, PresentableAlert {
    
    // MARK: - Outlets
    @IBOutlet private weak var movieDetailsLabel: UILabel!
    @IBOutlet private weak var movieReleaseDateLabel: UILabel!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    // MARK: - Properties
    private var cancellables = AppBag()
    private let viewModel: MovieDetailsViewModel
    
    // MARK: - Init
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViews()
        addLoader()
        bindErrorMessage()
        title = Messages.movieDetails.rawValue
    }
    
    // MARK: - Functions
    private func bindViews() {
        viewModel.$movieUIModel
            .sink(receiveValue: setDataForViews)
            .store(in: &cancellables)
    }
    
    private func setDataForViews(_ model: MovieUIModel) {
        movieImage.load(with: model.imageURL)
        movieNameLabel.text = model.name
        movieDetailsLabel.text = model.overView
        movieReleaseDateLabel.text = model.year
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
