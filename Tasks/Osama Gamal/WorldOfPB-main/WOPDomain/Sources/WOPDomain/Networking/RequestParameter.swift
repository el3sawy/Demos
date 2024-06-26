//
//  RequestParameter.swift
//
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation
public struct RequestParameter {
    public let name: String
    public let value: Parameter

    public init(name: String, value: Parameter) {
        self.name = name
        self.value = value
    }
}
