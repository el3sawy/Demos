//
//  ListCitiesViewController.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import UIKit
import Resolver

protocol ListCitiesViewProtocol: LoadingViewCapable {
    func isShowErrorMessage(_ show: Bool)
    func didLoadWeathers(_ weathers: [WeatherViewModel])
}

class ListCitiesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var errorMessageLabel: UILabel!
    @IBOutlet private weak var cityNameTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(
                UINib(nibName: WeatherTableViewCell.identifier, bundle: nil),
                forCellReuseIdentifier: WeatherTableViewCell.identifier)
            tableView.rowHeight = 60
        }
    }
    
    // MARK: - Variables
    private let dataSource = ListWeatherTableViewDataSource()
    @Injected private var presenter: ListWeatherPresenterProtocol
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }
    
    // MARK: - Button Actions
    @IBAction private func searchButtonTapped(_ sender: Any) {
        presenter.searchWeatherBy(city: cityNameTextField.text)
    }
}

// MARK: - Extension for presenter actions
extension ListCitiesViewController: ListCitiesViewProtocol {
    func isShowErrorMessage(_ show: Bool) {
        errorMessageLabel.isHidden = !show
    }
    
    func didLoadWeathers(_ weathers: [WeatherViewModel]) {
        dataSource.weathers = weathers
        tableView.reloadData()
    }
}
