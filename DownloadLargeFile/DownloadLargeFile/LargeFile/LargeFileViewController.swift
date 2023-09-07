//
//  LargeFileViewController.swift
//  DownloadLargeFile
//
//  Created by Ahmed Elesawy on 24/10/2022.
//

import UIKit

class LargeFileViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDownloadProgress(notification:)), name: .downloadProgress, object: nil)
    }
    
    @objc func onDownloadProgress(notification: Notification) {
        
        guard let progress = notification.userInfo?["progress"] as? Float
            else {
            return
        }
        
        let formattedProgress = String(format: "%.1f%%", progress * 100.0)
        progressLabel.text = formattedProgress
        progressView.progress = progress
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        let url = "https://lb.aait-d.com//tiktalent//public//storage//files//video//1654418937Social_Media_R.mp4"
        DownloadController.shared.download(url: url)
        
        progressView.progress = 0
        progressView.isHidden = false
        
        progressLabel.text = ""
        progressLabel.isHidden = false
    }
    
}

