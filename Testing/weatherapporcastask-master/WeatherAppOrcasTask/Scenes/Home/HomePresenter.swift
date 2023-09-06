//
//  HomePresenter.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import Foundation
protocol HomePresenterProtocol {
    func featchWeatherBy(city name: String?)
    var count: Int { get }
    func config(_ cell: WeatherCellProrocol, at index: Int)
}

class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewProtocol?
    private var repo: HomeRepositoryProtocol
    
    private var listWeathers: WeatherListVM?
    
    init(view: HomeViewProtocol, repo: HomeRepositoryProtocol) {
        self.view = view
        self.repo = repo
    }
    
    var count: Int {
        return listWeathers?.weathers.count ?? 0
    }
    
    private func validator(searchText: String?) -> Bool{
        guard let text = searchText, text.trimmedString.count > 0 else {
            view?.showMessage(message: "Please enter city name")
            return false
        }
        return true
    }
    
    func featchWeatherBy(city name: String?) {
        guard validator(searchText: name) else {return}
        view?.showIndicator()
        repo.featchWeatherBy(city: name!) { [weak self] (response) in
            self?.view?.hideIndicator()
            self?.handleResponse(response, city: name!)
        }
    }
    
    private func handleResponse(_ response: AppRepsone<WeatherDataModel>, city name: String) {
        
        switch response {
        case .success(let value):
            if value.isSuccess {
                let result = WeatherListVM(items: value.weather ?? [], cityName: name)
                successResponse(data: result)
            }else {
                searchFromLcoalStorage(city: name)
            }
        case .error(_):
            searchFromLcoalStorage(city: name)
        }
    }
    
    private func successResponse(data: WeatherListVM) {
        listWeathers = data
        repo.saveToLocalStorage(object: data)
        view?.successFeatchData()
    }
    
    private func searchFromLcoalStorage(city name: String) {
        listWeathers = repo.featchFromLocalStorageBy(city: name)
        if let _ = listWeathers {
            view?.dataFromLcocal()
        }else {
            view?.retryFeatchData()
        }
    }
    
    func config(_ cell: WeatherCellProrocol, at index: Int) {
        let title = listWeathers?.weathers[index].title ?? ""
        let details = listWeathers?.weathers[index].destails ?? ""
        cell.displayTitle(title)
        cell.disolayDetails(details)
    }
}
