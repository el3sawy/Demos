//
//  DownloadImage.swift
//  ModernConcurrency
//
//  Created by Ahmed Elesawy on 07/11/2022.
//

import Combine
import Foundation
import UIKit

class DownloadImage {
    private let url = URL(string: "https://i.picsum.photos/id/154/200/200.jpg?hmac=ljiYfN3Am3TR0-aMErtWNuSQm8RTYarrv2QJfmWG6Cw")!
    
    private func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200, response.statusCode < 300 else {
            return nil
        }
        
        return image
        
    }
    
    func downloadByCombine() -> AnyPublisher<UIImage?, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError({ $0 })
            .receive(on: DispatchQueue.main )
            .eraseToAnyPublisher()
    }
    
    func downloadAsync() async throws -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return handleResponse(data: data, response: response)
        } catch {
            throw error
        }
    }
    
    func getTitle() async -> String {
        return "Ahmed"
    }
    
    func downloadBy() -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .mapError({ $0 })
            .receive(on: DispatchQueue.main )
            .eraseToAnyPublisher()
    }
    
    func test() {
        downloadBy().sink { _ in} receiveValue: { data in
            
        }
        
    }
    
    func loadNormal() {
        
    }
}
