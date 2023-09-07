//
//  BaseCodable.swift
//  Base
//
//  Created by Ahmed Elesawy on 4/25/20.
//  Copyright © 2020 Ahmed Elesawy. All rights reserved.
//

import Foundation

protocol BaseCodable: Codable {
    var statusCode: Int? { get set }
    var message: String? { get set}
}

struct BaseModel: BaseCodable {
    var statusCode: Int?
    var message: String?
}
