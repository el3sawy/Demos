//
//  NetworkingType.swift
//
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation

public protocol NetworkingType {
    func request<R: ResourceType>(_ resource: R) async -> Result<R.Response, NetworkError>
}

