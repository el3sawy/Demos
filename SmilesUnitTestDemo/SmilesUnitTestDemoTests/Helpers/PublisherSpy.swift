//
//  PublisherSpy.swift
//  SmilesUnitTestDemoTests
//
//  Created by Ahmed Naguib on 16/01/2024.
//

import Foundation
import Combine

final public class PublisherSpy<T> {
    private(set) public var value: T!
    private var cancellable: Cancellable?
    
    public init(_ publisher: any Publisher<T, Never>) {
        cancellable = publisher.sink { [weak self] value in
            self?.value = value
        }
    }
}


extension Publisher {
   public func collectNext(_ count: Int) -> AnyPublisher<[Output], Failure> {
        self.dropFirst()
            .collect(count)
            .first()
            .eraseToAnyPublisher()
    }
}
