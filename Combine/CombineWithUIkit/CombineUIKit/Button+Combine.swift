//
//  Button+Combine.swift
//  CombineWithUIkit
//
//  Created by Ahmed Elesawy on 28/01/2023.
//

import Foundation
import Combine
import UIKit

extension UIButton {
    var tapPublisher: EventPublisher {
        publisher(for: .touchUpInside)
    }
}
