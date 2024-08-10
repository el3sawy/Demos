//
//  DependencyContainerType.swift
//  WOPDomain
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation

public protocol DependencyContainerType {
    var networking: NetworkingType { get }
    var configurations: ConfigurationsProviderType { get }
}
