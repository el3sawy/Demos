//
//  ImageLoaderTests.swift
//  CombineUnitTestTests
//
//  Created by Ahmed Elesawy on 22/02/2023.
//

import XCTest
import Foundation
import Combine
import UIKit
@testable import CombineUnitTest

class ImageLoaderTests: XCTestCase {
    var cancellables=Set<AnyCancellable>()
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testImageLoaderClearsImagesOnMemoryWarning() {
        let notificationCenter = NotificationCenter()
        let imageLoader = ImageLoader(notificationCenter)
        // store a dummy image
        let image = UIImage(systemName: "house")
        let url = URL(string: "https://fake.url/house")!
        imageLoader.images[url] = image
        XCTAssertNotNil(imageLoader.images[url])
        
        let memoryWarning = UIApplication.didReceiveMemoryWarningNotification
        notificationCenter.post(Notification(name: memoryWarning))
        
        XCTAssertNil(imageLoader.images[url])
    }
    
    func testImageLoaderLoadsImageFromNetwork() {
        let mockNetwork = MockImageNetworkProvider()
        let notificationCenter = NotificationCenter()
        let imageLoader = ImageLoader(notificationCenter, network: mockNetwork)
        let url = URL(string: "https://fake.url/house")!
        
        //        let loadCompleted = expectation(description: "expected image load to complete")
        let imageReceived = expectation(description: "expected to receive an image")
        
        imageLoader.loadImage(url: url).sink(receiveCompletion: { completion in
            guard case .finished = completion else {
                XCTFail("Expected load to complete succesfully")
                return
            }
            
            // verify our assumptions
            XCTAssertEqual(mockNetwork.wasLoadURLCalled, true)
            XCTAssertNotNil(imageLoader.images[url])
            //            loadCompleted.fulfill()
        }, receiveValue: { image in
            imageReceived.fulfill()
        }).store(in: &cancellables)
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testImageLoaderLoadsImageFromNetwork2() {
        let mockNetwork = MockImageNetworkProvider()
        let notificationCenter = NotificationCenter()
        let imageLoader = ImageLoader(notificationCenter, network: mockNetwork)
        let url = URL(string: "https://fake.url/house")!
        let result = awaitCompletion(for: imageLoader.loadImage(url: url))
        XCTAssertNoThrow(try result.get()) // No error occurred
        XCTAssertEqual(mockNetwork.wasLoadURLCalled, true)
        XCTAssertNotNil(imageLoader.images[url])
        
    }
}


extension XCTestCase {
    func awaitCompletion<P: Publisher>(for publisher: P) -> Result<[P.Output], P.Failure> {
        let finishedExpectation = expectation(description: "completion expectation")
        var output = [P.Output]()
        var result: Result<[P.Output], P.Failure>!
        _ = publisher.sink(receiveCompletion: { completion in
            if case .failure(let error) = completion {
                result = .failure(error)
                
            } else {
                result = .success(output)
            }
            finishedExpectation.fulfill()
        }, receiveValue: { value in
            output.append(value)
            
        })
        waitForExpectations(timeout: 1.0, handler: nil)
        return result
    }
}

extension Publisher where Output: Equatable {
    func assertOutput(matches: [Output], expectation: XCTestExpectation) -> AnyCancellable {
        var expectedValues = matches

        return self.sink(receiveCompletion: { _ in
            
        }, receiveValue: { value in
            guard let expectedValue = expectedValues.first else {
                XCTFail("The publisher emitted more values than expected.")
                return
            }
            
            guard expectedValue == value else {
                XCTFail("Expected received value \(value) to match first expected value \(expectedValue)")
                return }
            
            expectedValues = Array(expectedValues.dropFirst())
            if expectedValues.isEmpty {
                expectation.fulfill()
            }
        })
    }
}
