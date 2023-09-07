//
//  WeatherTableViewCell.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 09/11/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    // MARK: - Outlets
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var item: WeatherViewModel? {
        didSet {
            detailsLabel.text = item?.details
            titleLabel.text = item?.title
        }
    }
}
