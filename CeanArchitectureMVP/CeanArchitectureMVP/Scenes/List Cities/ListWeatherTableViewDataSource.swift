//
//  ListWeatherTableViewDataSource.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import UIKit

class ListWeatherTableViewDataSource: NSObject {
    var weathers: [WeatherViewModel] = []
}

extension ListWeatherTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WeatherTableViewCell.identifier) as?  WeatherTableViewCell
        else {return UITableViewCell()}
        cell.item = weathers[indexPath.row]
        return cell
    }
}
