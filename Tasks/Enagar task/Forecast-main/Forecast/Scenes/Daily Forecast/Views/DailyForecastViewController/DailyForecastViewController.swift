//
//  DailyForecastViewController.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import UIKit
import SnapKit

final class DailyForecastViewController: BaseViewController {

    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.sizeToFit()
        bar.placeholder = "Enter City Name..."
        return bar
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .lightGray
        return refreshControl
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.showsVerticalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var contentView: UIActivityView = {
        let view = UIActivityView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var emptyForecastView: UIViewController = {
        return ForecastEmptyStateViewController(.emptyForecast)
    }()
    
    lazy var viewModel: ForecastViewModel = {
        let viewModel = ForecastViewModel(router: router)
        viewModel.isLoading.subscribe { [weak contentView, weak refreshControl] in
            $0 ? contentView?.startAnimating() : contentView?.stopAnimating()
            $0 ? refreshControl?.beginRefreshing() : refreshControl?.endRefreshing()
        }
        viewModel.isEmptyStateShown.subscribe { [weak tableView, weak emptyForecastView] in
            tableView?.backgroundView = $0 ? emptyForecastView?.view : nil
        }
        viewModel.reloadTableView.subscribe { [weak tableView] in tableView?.reloadData() }
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views
private extension DailyForecastViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        setupSearchBar()
        setupContentView()
        setupRefreshControl()
        setupTableView()
        configureTableView()
    }
    
    func setupSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
        searchBar.delegate = viewModel
    }
    
    func setupContentView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupTableView() {
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
    
    func configureTableView() {
        tableView.register(nibWithCellClass: ForecastTableViewCell.self)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.refreshControl = refreshControl
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(viewModel, action: #selector(viewModel.refreshForecastData), for: .valueChanged)
    }
}
