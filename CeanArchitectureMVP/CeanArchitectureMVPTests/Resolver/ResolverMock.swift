//
//  ResolverTests.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 16/11/2021.
//

import Foundation
import Resolver
@testable import CeanArchitectureMVP

extension Resolver {
    // MARK: - Mock Container
    static var mock = Resolver(parent: .main)
    
    // MARK: - Register Mock Services
    static func registerMockServices() {
        root = Resolver.mock
        defaultScope = .application
        registerNetwork()
        registerWeatherRepository()
    }
}
