//
//  PublicRepositoryEndpoint.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import CoreNetwork

enum PublicRepositoryEndpoint {
    case getPublicRepository
}

extension PublicRepositoryEndpoint: EndpointProtocol {

    // Should be handled as base url for all the app and read from config file, change the pathes.
    var baseURL: String {
        return "https://api.github.com/"
    }

    var path: String {
        switch self {
        case .getPublicRepository:
            return "/repositories"
        }
    }
}
