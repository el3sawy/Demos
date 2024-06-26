//
//  ForecastEmptyStateViewController.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 09/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import UIKit

final class ForecastEmptyStateViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "weather-forecast"))
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily Forecast isn't available"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "something get wrong, pull to refresh."
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel],
                                    axis: .vertical,
                                    spacing: 8, alignment: .center)
        return stackView
    }()
    
    private lazy var emptyStateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleStackView],
                                    axis: .vertical,
                                    spacing: 16, alignment: .center)
        return stackView
    }()
    
    var emptyStateType: EmptyStateType = .emptyForecast
    
    private lazy var viewModel: ForecastEmptyStateViewModel = {
        let viewModel = ForecastEmptyStateViewModel(emptyStateType: emptyStateType)
        viewModel.emptyStateImageName.subscribe { [weak imageView] in
            imageView?.image = UIImage(named: $0)
        }
        viewModel.emptyStateTitle.subscribe { [weak titleLabel] in
            titleLabel?.text = $0 }
        viewModel.emptyStateSubtitle.subscribe { [weak subtitleLabel] in
            subtitleLabel?.text = $0 }
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(emptyStateStackView)
        setupConstraints()
        viewModel.viewDidLoad()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.equalTo(235)
            make.width.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(24)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(24)
        }
        
        emptyStateStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    init(_ emptyStateType: EmptyStateType) {
        super.init(nibName: nil, bundle: nil)
        self.emptyStateType = emptyStateType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
