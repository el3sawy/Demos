//
//  PublicRepositoryUI.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import ImageCache
import UIKit
import Domain

public class PublicRepositoryUI: Identifiable, ObservableObject {
    @Published var image: UIImage
    
    public let id: Int
    public let title: String
    public let ownerName: String
    public let description: String?
    public let ownerAvatar: ImageItem
    
    func fetchImage() {
        ImageCache.public.load(url: ownerAvatar.url as NSURL, item: ownerAvatar) { fetchedItem, image in
            if let img = image, img != fetchedItem.image {
                self.image = img
                self.ownerAvatar.image = img
            }
        }
    }
    
    func onReuse() {
        ImageCache.public.cancelLoad(ownerAvatar.url as NSURL)
        self.image = UIImage(systemName: "photo")!
        self.ownerAvatar.image = UIImage(systemName: "photo")!
    }
    
    init(id: Int, title: String, ownerName: String, description: String?, ownerAvatarURL: String) {
        self.id = id
        self.title = title
        self.ownerName = ownerName
        self.description = description
        self.ownerAvatar = ImageItem(
            image: UIImage(systemName: "photo")!,
            url: URL(string: ownerAvatarURL)!
        )
        self.image = UIImage(systemName: "photo")!
    }
}
