//
//  APIServiceMock.swift
//  MVVMPlaygroundTests
//
//  Created by Yahya Saddiq on 2/1/20.
//  Copyright © 2020 ysaddiq. All rights reserved.
//

import Foundation
@testable import MVVMPlayground
// The mock APIService(APIServiceMock) object doesn’t connect to the real server,
// it’s an object designed only for the test.
// Both APIServiceand APIServiceMock conform to APIServiceProtocol,
// so that we are able to inject different dependency in different situation.
class APIServiceMock: APIServiceProtocol{
    var fetchPopularPhotosIsCalled = false
    var fetchPhotosIsCalled = false

    var photos: [Photo] = [Photo]()
    var completeClosure: (([Photo]?, APIError?) -> ())!

    func fetchPopularPhotos(complete: @escaping ([Photo]?, APIError?) -> ()) {
        fetchPopularPhotosIsCalled = true
        completeClosure = complete
    }

    func fetchPhotos(from url: URL?, complete: @escaping ([Photo]?, APIError?) -> ()) {
        fetchPhotosIsCalled = true
    }

    func fetchSuccess() {
        completeClosure(photos, nil)
    }

    func fetchFail(error: APIError?) {
        completeClosure(nil, error)
    }
}
