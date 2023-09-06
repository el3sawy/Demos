//
//  BaseViewProtocol.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

import UIKit
protocol BaseViewProtocol where Self: UIViewController {
    func showIndicator()
    func hideIndicator()
    func showMessage(message: String)
}
