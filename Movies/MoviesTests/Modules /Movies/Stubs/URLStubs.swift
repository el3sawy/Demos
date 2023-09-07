//
//  URLStubs.swift
//  MoviesTests
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation

enum URLStubs {
    static var url: URL { URL(string: "//any.com/")! }
    static var urlRequest: URLRequest { URLRequest(url: url) }
}
