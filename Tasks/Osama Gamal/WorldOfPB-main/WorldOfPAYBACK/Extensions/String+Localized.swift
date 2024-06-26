//
//  Bundle.swift
//  
//
//  Created by Osama Gamal on 08/05/2023.
//

import Foundation
extension String {
  var localized: String {
    NSLocalizedString(self, bundle: Bundle.main, comment: "")
  }
}
