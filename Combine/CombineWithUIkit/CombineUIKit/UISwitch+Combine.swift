//
//  UISwitch+Combine.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import Foundation
import Combine
import UIKit

extension UISwitch {
    var switchPublisher: AnyPublisher<Bool, Never> {
        publisher(for: .valueChanged)
            .map { self.isOn }
            .eraseToAnyPublisher()
    }
}
