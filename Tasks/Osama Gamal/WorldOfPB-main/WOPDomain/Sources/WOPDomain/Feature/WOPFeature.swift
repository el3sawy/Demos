//
//  WOPFeature.swift
//  WOPDomain
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
import UIKit

// This is used to identify new features injected into the app, so everytime someone consumes Configurator of the feature, each feature will have a unique ID so maybe we have a dependency which will be injected to the feature, we want to re-construct it so it can hold reference to this feature,
// For example, networking, can hold reference to the feature so it can keep it in header requests
// or Analytics module
public protocol WOPFeature {
    var featureId: String { get }
}
