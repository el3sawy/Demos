//
//  WeatherRepository+Injection.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 17/11/2021.
//

import Foundation
import Resolver
@testable import CeanArchitectureMVP

extension Resolver {
    
    static func registerWeatherRepository() {
        Resolver.mock.register { NetworkSpy() }.implements(NetworkProtocol.self)
        Resolver.mock.register { LocalStorageSpy() }.implements(LocalStorageProtocol.self)
    }
}
