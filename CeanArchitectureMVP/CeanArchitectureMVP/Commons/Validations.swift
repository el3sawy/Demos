//
//  Validations.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation

protocol ValidationsProtocol {
  @discardableResult
  func city(name: String?) throws -> String
}

class Validations {
    @discardableResult
    func city(name: String?) throws -> String {
        guard !(name?.isEmpty ?? true)  else {
            throw MessagesEnum.cityName
        }
        return name!
    }
}
extension Validations: ValidationsProtocol {}
