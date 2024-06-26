//
//  NetworkServiceProxy.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 07/05/2023.
//

import WOPDomain
import ConsumerNetworking

/// This proxy is responsible for re-consutrct the network service to pass feature as consumer id
final class NetworkServiceProxy: NetworkingType {
    let networking: NetworkingType
    
    init(feature: WOPFeature,
         configurations: ConfigurationsProviderType) {
        let requestBuilder = RequestBuilder(
            configurations: configurations,
            consumerId: feature.featureId)
        self.networking = NetworkingService(requestBuilder: requestBuilder)
    }
    
    func request<R>(_ resource: R) async -> Result<R.Response, WOPDomain.NetworkError> where R : WOPDomain.ResourceType {
        await networking.request(resource)
    }
}
