//
//  DiContainer.swift
//  DiFactoryDemo
//
//  Created by Ahmed Naguib on 11/01/2024.
//

import Foundation
import Factory

extension Container {
    var network:  Factory<NetworkLayerProtocol> {
        Factory(self) { NetworkLayer() }
            .scope(.cached)
    }
    
    var test: ParameterFactory<String, Test> {
        self { Test(name: $0, id: 2) }
    }
}


class Test {
    
    let name: String
    let id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}
