//
//  ListWeatherPresenter.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 11/11/2021.
//

import Foundation
import Resolver

protocol ListWeatherPresenterProtocol {
    func searchWeatherBy(city name: String?)
}

class ListWeatherPresenter {
    // MARK: - Variables
    @Injected private var weatherUseCase: WeatherUsesCaseProtocol
    @WeakLazyInjected var view: ListCitiesViewProtocol?
    @Injected private var validator: ValidationsProtocol
    @Injected private var router: WeatherRouterProtocol
}

// MARK: - Extension
extension ListWeatherPresenter: ListWeatherPresenterProtocol {
    
    func searchWeatherBy(city name: String?) {
        guard validation(city: name) else {return}
        view?.showLoader()
        weatherUseCase.searchWeatherBy(city: name ?? "") { [weak self] response  in
            guard let self = self else {return}
            
            self.view?.hideLoader()
            self.handleSearchWeather(response: response)
        }
    }
    
    private func handleSearchWeather(response: AppResponse<[WeatherViewModel]>) {
        switch response {
        case .success(let weathers):
            view?.didLoadWeathers(weathers)
            view?.isShowErrorMessage(false)
        case let .error(_, weathers):
            view?.didLoadWeathers(weathers ?? [])
            view?.isShowErrorMessage(true)
        }
    }
    
    private func validation(city name: String?) -> Bool {
        do {
            try validator.city(name: name)
            return true
        } catch {
            guard let authError = error as? MessagesEnum else {return false}
            
            self.router.showAlert(message: authError.description)
            return false
        }
    }
}
