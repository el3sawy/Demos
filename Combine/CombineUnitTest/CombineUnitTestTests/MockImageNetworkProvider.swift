//
//  MockImageNetworkProvider.swift
//  CombineUnitTestTests
//
//  Created by Ahmed Elesawy on 22/02/2023.
//

import Foundation
import UIKit
@testable import CombineUnitTest
import Combine

class MockImageNetworkProvider: ImageNetworking {
    var wasLoadURLCalled = false
    
    func loadURL(_ url: URL) -> AnyPublisher<Data, Error> {
        wasLoadURLCalled = true
        
        let data = UIImage(systemName: "house")!.pngData()!
           return Just(data)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
