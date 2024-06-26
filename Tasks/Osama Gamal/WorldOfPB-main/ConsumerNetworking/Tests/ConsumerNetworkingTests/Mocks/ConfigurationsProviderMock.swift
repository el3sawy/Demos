//
//  ConfigurationsProviderMock.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import WOPDomain

struct ConfigurationsProviderMock: ConfigurationsProviderType {
    var environment: AppEnvironment = .staging
}
