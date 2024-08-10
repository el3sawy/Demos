//
//  ResultDecoder.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation
import CoreError

public struct ResultDecoder<T> {

    private let transform: (Data) throws -> T

    init (transform: @escaping (Data) throws -> T) {
        self.transform = transform
    }

    func decode(_ result: DataResult) -> Result<T, CoreError> {

        result.flatMap { (data) -> Result<T, CoreError> in

            let result = Result {
                return try transform(data)
            }

            return result.mapError { _ in .response(code: "\(URLError.cannotParseResponse.rawValue)") }
        }
    }
}
