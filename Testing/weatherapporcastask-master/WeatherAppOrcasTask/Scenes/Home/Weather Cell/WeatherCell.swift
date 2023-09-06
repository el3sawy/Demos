//
//  WeatherTableViewCell.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import UIKit
protocol WeatherCellProrocol {
    func displayTitle(_ text: String)
    func disolayDetails(_ text: String)
}

class WeatherCell: UITableViewCell {

    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
}

extension WeatherCell: WeatherCellProrocol {
    func displayTitle(_ text: String) {
        lblTitle.text = text
    }
    
    func disolayDetails(_ text: String) {
        lblDetails.text = text
    }
}
