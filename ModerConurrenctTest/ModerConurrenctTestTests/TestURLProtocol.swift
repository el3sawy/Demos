//
//  TestURLProtocol.swift
//  ModerConurrenctTestTests
//
//  Created by Ahmed Elesawy on 03/01/2023.
//

import Foundation

class TestURLProtocol: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    
    override func startLoading() {
        guard let client = client,
              let url = request.url,
              let response = HTTPURLResponse(url: url,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) else {
                  fatalError("Client or URL missing")
              }
        
        client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client.urlProtocol(self, didLoad: PostsStubs.getListPostsData()!)
        client.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
    }
}
