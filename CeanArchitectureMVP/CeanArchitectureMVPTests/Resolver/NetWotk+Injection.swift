//
//  NetWotk+Injection.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver
@testable import CeanArchitectureMVP

extension Resolver {
    static func registerNetwork() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        Resolver.mock.register { URLSession(configuration: config) }.implements(NetworkProtocol.self)
    }
}
