//
//  NetworkLayer.swift
//  DiFactoryDemo
//
//  Created by Ahmed Naguib on 11/01/2024.
//

import Foundation

protocol NetworkLayerProtocol {
    func request(endPoint: String)
}

class NetworkLayer: NetworkLayerProtocol {
    
    func request(endPoint: String) {
        print(endPoint)
    }
}
