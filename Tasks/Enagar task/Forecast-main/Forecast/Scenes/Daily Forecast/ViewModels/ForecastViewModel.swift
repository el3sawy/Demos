//
//  ForecastViewModel.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import UIKit.UITableView

final public class ForecastViewModel: NSObject {
    
    private let router: RouterProtocol
    private let network: NetworkProtocol
    private let cache: CacheManager
    private let model: ForecastModel
    private var currentCity: String? = nil
    
    var dailyForecasts = [DailyForecast]() {
        didSet {
            isEmptyStateShown.value = dailyForecasts.isEmpty
        }
    }
    
    public var isLoading = Dynamic<Bool>(false)
    public var isEmptyStateShown = Dynamic<Bool>(false)
    public var reloadTableView = Dynamic<Void>(nil)
    
    public init(router: RouterProtocol,
                model: ForecastModel = .init()) {
        self.router = router
        self.network = ServiceLocator.shared.network
        self.cache = ServiceLocator.shared.cache
        self.model = model
    }
    
    @objc func refreshForecastData() {
        fetchDailyForecast(for: currentCity)
    }
    
    func fetchDailyForecast(for cityName: String?) {
        do {
            let validCity = try model.isValid(city: cityName)
            isLoading.value = true
            currentCity = validCity
            ForecastFetcher(network: network, cache: cache).fetchDailyForecast(for: validCity, fetchedDailyForecast)
        } catch {
            isLoading.value = false
            alertUser(with: error)
        }
    }
}

// MARK: - Daily Forecast Data
private extension ForecastViewModel {
    
    var fetchedDailyForecast: (Result<DailyForecastResponse, Error>, Bool?) -> Void {
        return { [weak self] result, isAccurate in
            guard let self = self else { return }
            self.isLoading.value = false
            
            switch result {
            case .failure(let error):
                self.alertUser(with: error)
            case .success(let value):
                if let isAccurate = isAccurate, !isAccurate {
                    self.router.showWarning(title: "", message: "Daily Forecast isn't accurate, pull to refresh it.", messageLayout: .statusLine)
                }
                self.dailyForecasts = value.list
                self.reloadTableView.value = ()
            }
        }
    }
    
    func alertUser(with error: Error) {
        switch error {
        case let error as LocalError:
            router.showWarning(title: "", message: error.localizedDescription, messageLayout: .statusLine)
        default:
            router.showError(error: error, messageLayout: .messageView)
        }
    }
}

// MARK: - UISearchBarDelegate
extension ForecastViewModel: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        fetchDailyForecast(for: searchBar.text)
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        fetchDailyForecast(for: searchBar.text)
    }
}

// MARK: - UITableViewDelegate, DataSource
extension ForecastViewModel: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dailyForecasts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ForecastTableViewCell
        cell.configureCell(with: dailyForecasts[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
