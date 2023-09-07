//
//  ImageLoader.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 22/02/2023.
//

import Foundation
import Combine
import UIKit

protocol ImageNetworking {
    func loadURL(_ url: URL) -> AnyPublisher<Data, Error>
}


class ImageLoader {
    var images = [URL: UIImage]()
    var cancellables = Set<AnyCancellable>()
    let network: ImageNetworking
    
    init(_ notificationCenter: NotificationCenter = NotificationCenter.default,
         network: ImageNetworking = ImageNetworkProvider()) {
        self.network = network
        let notification = UIApplication.didReceiveMemoryWarningNotification
        
        notificationCenter.publisher(for: notification).sink(receiveValue: { [weak self] _ in
            self?.images = [URL: UIImage]()
        })
            .store(in: &cancellables)
    }
    
    func loadImage(url: URL)->AnyPublisher <UIImage,Error> {
        if let image = images[url] {
            return Just(image).setFailureType(to: Error.self).eraseToAnyPublisher()
            //            return Fail(error: ImageLoaderError.invalidData).eraseToAnyPublisher()
        }
        
        return network.loadURL(url)
            .tryMap({ data in
                guard let image = UIImage(data: data) else {
                    throw ImageLoaderError.invalidData
                }
                return image
            })
        
            .handleEvents(receiveOutput: { [weak self] image in // we use it to get the output from tryMap
                self?.images[url] = image
            })
            .eraseToAnyPublisher()
    }
}


enum ImageLoaderError: Error {
    case invalidData
}


class ImageNetworkProvider: ImageNetworking {
    func loadURL(_ url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError({$0 as Error})
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
