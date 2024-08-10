//
//  ResourceType.swift
//
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation

public protocol ResourceType {
    /// Expected response type
    associatedtype Response

    /**
        Resource HTTP method
    ```
        // Definition example
        var method: HTTPMethod = .get
    ```
    */
    var method: HTTPMethod { get }
    /**
        Resource path
    ```
        // Definition example
        var path: String = "path/to/demo/resource"
    ```
    */
    var path: String { get }
    /**
        Resource request parameters
    ```
        // Definition Example
        var parameters: [RequestParameter] {
            return [
                .init(name: "pageId", value: query("1"))
            ]
        }
    ```
    */
    var parameters: [RequestParameter] { get }
    /**
        Getting request base URL
        - Returns: base url as a string
    ```
        // Definition example
        func baseURL(for environment: Environment) -> String {
            "https://api.payback.com"
        }
    ```
    */
    func baseURL(for environment: AppEnvironment) -> String
    /**
        Parsing response data into expected response type
        - Parameter data: Response data
        - Parameter response: HTTP response
        - Returns: Parsed response result
        - Throws: Parsing exceptions
    ```
        // Definition Example
        func parse(data: Data, response: HTTPURLResponse) throws -> ExampleResponse {
            let decoder = JSONDecoder()
            return try decoder.decode(ExampleResponse.self, from: data)
        }
    ```
    */
    func parse(data: Data, response: HTTPURLResponse) throws -> Response
}
