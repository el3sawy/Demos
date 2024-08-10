//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

public enum HttpMethod: String {
    case get
    case head
    case post
    case put
    case delete
    case connect
    case options
    case trace
    case patch

    public var value: String {
        return rawValue.uppercased()
    }
}
