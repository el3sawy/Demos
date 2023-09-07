//
//  WeatherStubs.swift
//  CeanArchitectureMVPTests
//
//  Created by Ahmed Elesawy on 12/11/2021.
//

import Foundation
@testable import CeanArchitectureMVP

class BaseModelStubs {
    static func createModel() -> BaseModel {
        let user = BaseModel(uuid: "Test UUID", statusCode: 200, message: "Success")
        return user
    }
    static func modelData() -> Data? {
        let jsonData = try? JSONEncoder().encode(createModel())
        return jsonData
    }
}

struct BaseModel: BaseCodable {
    var uuid: String?
    var statusCode: Int?
    var message: String?
}
