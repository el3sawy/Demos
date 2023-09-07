//
//  File.swift
//  CombineWithApi
//
//  Created by Ahmed Elesawy on 31/01/2023.
//
/*
 1- defer with retry
    https://stackoverflow.com/questions/59224781/swift-combine-is-there-any-way-to-call-a-publisher-block-more-than-once-when-r
 
 */


import Foundation
import Combine

enum TestFailureCondition: Error {
    case invalidServerResponse
    case noInternetConnection
}
class RetryWithDeferred {
    
    // https://stackoverflow.com/questions/64938442/swift-combine-retry-only-for-some-error-types
    //https://stackoverflow.com/questions/66055354/cannot-convert-return-expression-of-type-anypublisherdemoobject-never-apie
    //https://peterfriese.dev/posts/swiftui-combine-networking-errorhandling/
    //https://heckj.github.io/swiftui-notes/#patterns-retry
//https://developer.apple.com/videos/play/wwdc2019/721
    //https://www.youtube.com/watch?v=Inezy3IHH2w
    
    //https://www.youtube.com/watch?v=lmLPEUb_Vhc
    private var backgroundQueue: DispatchQueue = DispatchQueue(label: "backgroundQueue")
    
    
    var failPublisher: AnyPublisher<(Data, URLResponse), Error> {
//        Deferred {
        Future<(Data, URLResponse), Error> { promise in
            print("Attempt to call")
            self.backgroundQueue.asyncAfter(deadline: .now() + Double.random(in: 1..<3)) {
                promise(.failure(TestFailureCondition.invalidServerResponse))
            }
//        }
        }.eraseToAnyPublisher()
        
    }
}
