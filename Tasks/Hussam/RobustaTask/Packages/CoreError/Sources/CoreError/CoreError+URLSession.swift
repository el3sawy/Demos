//
//  CoreError+URLSession.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation

public extension CoreError {

    init?(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error as? URLError {
            self = .request(code: "\(error.code)", message: error.localizedDescription)
            return
        }

        if let response = response as? HTTPURLResponse,
            !(200...299).contains(response.statusCode) {
            self = .response(code: "\(response.statusCode)")
            return
        }

        return nil
    }
}
