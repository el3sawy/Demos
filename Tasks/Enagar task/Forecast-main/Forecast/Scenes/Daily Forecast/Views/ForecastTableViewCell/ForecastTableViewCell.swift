//
//  ForecastTableViewCell.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet private weak var forecastTimeLabel: UILabel!
    @IBOutlet private weak var forecastImageView: UIImageView!
    @IBOutlet private weak var forecastMainTemperatureLabel: UILabel!
    @IBOutlet private weak var forecastMainLabel: UILabel!
    @IBOutlet private weak var forecastDescriptionLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        forecastTimeLabel.text = nil
        forecastImageView.image = nil
        forecastMainTemperatureLabel.text = nil
        forecastMainLabel.text = nil
        forecastDescriptionLabel.text = nil
    }
    
    func configureCell(with forecast: DailyForecast) {
        forecastTimeLabel.text = forecast.dtTxt.formattedDate
        let weatherIcon = (forecast.weather.first?.icon ?? "") + "@2x.png"
        forecastImageView.setImageWith(AppEnvironment.baseImageURL + weatherIcon)
        forecastMainTemperatureLabel.text = TemperaturePresenter().covertToCelsius(from: forecast.main.temp)
        forecastMainLabel.text = forecast.weather.first?.main
        forecastDescriptionLabel.text = forecast.weather.first?.description
    }
}
