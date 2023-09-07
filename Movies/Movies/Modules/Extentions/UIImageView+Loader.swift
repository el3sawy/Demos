//
//  UIImageView+Loader.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func load(with url: String?) {
        let placeholderImage = UIImage(named: "dummy")
        guard let imageURLString = url,
              let fullURLString = URL(string: DomainURL.image(path: imageURLString).path) else {
                  self.image = placeholderImage
                  return
              }
        af.setImage(withURL: fullURLString, placeholderImage: placeholderImage)
    }
}
