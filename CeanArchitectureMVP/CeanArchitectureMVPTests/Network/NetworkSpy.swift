//
//  NetworkSpy.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 13/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

class NetworkSpy: NetworkProtocol {
    var isCalledRequest = false
    
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) {
        isCalledRequest = true
    }
}
