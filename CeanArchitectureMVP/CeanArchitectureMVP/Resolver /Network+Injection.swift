//
//  Network+Injection.swift
//  CeanArchitectureMVP
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerNetwork() {
        register { URLSession(configuration: .default) }
        register {Network()}.implements(NetworkProtocol.self)
    }
}
