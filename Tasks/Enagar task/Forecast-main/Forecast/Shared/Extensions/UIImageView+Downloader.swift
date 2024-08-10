//
//  UIImageView+Downloader.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Kingfisher

extension UIImageView {
    
    func setImageWith(_ linkString: String?, _ placeholderImage: UIImage? = nil) {
        guard let linkString = linkString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: linkString) else { return }
        downloadImage(url, placeholderImage)
    }
    
    func setImageWith(url: URL?, _ placeholderImage: UIImage? = nil) {
        guard let url = url else { return }
        downloadImage(url, placeholderImage)
    }
}

private extension UIImageView {
    
    @discardableResult
    func downloadImage(_ url: URL, _ placeholderImage: UIImage?) -> DownloadTask? {
        kf.cancelDownloadTask()
        kf.indicatorType = .activity
        kf.indicator?.startAnimatingView()
        
        return self.kf.setImage(with: url, placeholder: placeholderImage, options: [.transition(.fade(1))], completionHandler:  { [weak self] result in
            guard let self = self else { return }
            self.kf.indicator?.stopAnimatingView()
            
            switch result {
            case .success(let value):
                self.image = value.image
            case .failure(let error):
                self.image = placeholderImage
                debugPrint(error.errorDescription ?? "failed download image")
            }
        })
    }
}
