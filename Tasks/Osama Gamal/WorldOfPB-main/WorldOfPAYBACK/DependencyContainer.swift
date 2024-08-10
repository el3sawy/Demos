//
//  AppFlowCoordinator.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 08/05/2023.
//

import Foundation
import WOPDomain
import ConsumerNetworking

final class DependencyContainer: DependencyContainerType {
    let networking: NetworkingType
    let configurations: ConfigurationsProviderType

    init(
        networking: NetworkingType? = nil,
        configurations: ConfigurationsProviderType
    ) {
        if let networking = networking {
            self.networking = networking
        } else {
            let requestBuilder = RequestBuilder(
                configurations: configurations,
                consumerId: "main")
            self.networking = NetworkingService(requestBuilder: requestBuilder)
        }
        self.configurations = configurations
    }
}
