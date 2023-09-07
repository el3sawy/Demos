//
//  RemoteImageView.swift
//  CompositionalLayoutDemo
//
//  Created by Ahmed Elesawy on 16/10/2022.
//

import UIKit
import Combine

class RemoteImageView: UIImageView {
    var imageCancellable: AnyCancellable?
    
    func load(with url: URL?) {
        guard let _url = url else { return }
        cancelImageRequest()
        
        imageCancellable = URLSession.shared.dataTaskPublisher(for: _url)
            .map { $0.data}
            .map { UIImage.init(data: $0) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancelImageRequest() {
        imageCancellable = nil
    }
}
