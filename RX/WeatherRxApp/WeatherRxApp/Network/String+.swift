//
//  String+.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import Foundation

extension String {
    public func addingPercentEncodingForQueryParameter() -> String {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? self
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)

        return allowed
    }()
}

