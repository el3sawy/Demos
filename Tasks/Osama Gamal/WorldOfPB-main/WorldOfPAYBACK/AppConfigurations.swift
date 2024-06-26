//
//  AppConfigurations.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 07/05/2023.
//

import WOPDomain

struct AppConfigurations: ConfigurationsProviderType {
    var environment: AppEnvironment {
        #if PROD
        return .production
        #else
        return .staging
        #endif
    }
}
