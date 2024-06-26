//
//  PhotoDetailViewController.swift
//  MVVMPlayground
//
//  Created by Yahya Saddiq on 03/10/2017.
//  Copyright © 2017 ysaddiq. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var imageUrl: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView?.download(from: imageUrl)
    }
}
